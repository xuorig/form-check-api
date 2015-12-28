class PresignedPost
  def initialize
    @presigned_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end

  def id
  end

  def url
    @presigned_post.url
  end

  def fields
    @presigned_post.fields
  end
end
