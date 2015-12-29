require 'open-uri'

class ScreenshotJob < ActiveJob::Base
  queue_as :default

  def perform(form_check_id)
    # Get Video from S3
    formcheck = FormCheck.find(form_check_id)
    video_url = URI.parse(formcheck.video_url)
    video_content = open(video_url)

    #Take a screehot
    movie = FFMPEG::Movie.new(video_content.path)
    screenshot = movie.screenshot("thumb.jpg", :seek_time => 3)
    thumb_file = File.new(screenshot.path)

    # Upload ScreenShot on S3
    obj = S3_BUCKET.object("thumbnails/thumb-#{form_check_id}.jpg")
    obj.upload_file(
      thumb_file,
      { acl: 'public-read' }
    )

    formcheck.thumbnail_url = obj.public_url
    formcheck.save!
  end
end
