Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['S3_ACCESS_KEY'], ENV['S3_SECRET_KEY']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
