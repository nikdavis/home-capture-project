require 'aws-sdk-s3'
require_relative './schema'
require_relative './s3_runs'
require_relative './security'

bucket_name = 'home_capture'

# get list of new files
# query mysql, if null, start from >= 0
# else grab last_security_id
puts "hello"
# s3 = Aws::S3::Resource.new(region:'us-west-2')
# obj = s3.bucket('').object('key')
# obj.upload_file('/path/to/source/file')
