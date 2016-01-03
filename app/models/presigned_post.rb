class PresignedPost
  def initialize(bucket)
    # Generate a presigned post from our s3 bucket
    @presigned_post = bucket.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

  # Relay always fetches id so we mock this method out
  def id
    #NOOP
  end

  def url
    @presigned_post.url
  end

  def fields
    @presigned_post.fields
  end
end
