require 'open-uri'

class ScreenshotJob < ActiveJob::Base
  queue_as :default

  def perform(form_check_id)
    # Get Video from S3
    formcheck = FormCheck.find(form_check_id)
    video_url = URI.parse(formcheck.video_url)
    video_content = open(video_url) {|f| f.read }

    #Take a screehot
    movie = FFMPEG::Movie.new(video_content)
    screenshot = movie.screenshot("screenshot.jpg", :seek_time => 1)

    # Upload ScreenShot on S3
    obj = S3_BUCKET.object('thumbnails')
    obj.upload_file(
      file.tempfile,
      { acl: 'public-read' }
    )

    formcheck.thumbnail_url = obj.public_url
    formcheck.save!
  end
end
