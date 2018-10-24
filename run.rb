require 'aws-sdk-s3'
require_relative './connection'
require_relative './s3_runs'
require_relative './security'

bucket_name = 'home_capture'


last_security_id = 0
last_run = S3Runs.last
if last_run
  last_security_id = last_run.last_security_id
end

puts Security.where('id > ?', last_security_id).length
# get list of new files
# query mysql, if null, start from >= 0
# else grab last_security_id
puts "hello"
# s3 = Aws::S3::Resource.new(region:'us-west-2')
# obj = s3.bucket('').object('key')
# obj.upload_file('/path/to/source/file')
