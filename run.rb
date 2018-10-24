require 'aws-sdk-s3'
require_relative './connection'
require_relative './s3_runs'
require_relative './security'

bucket_name = 'home_motion_capture'


last_security_id = 0
last_run = S3Runs.last
if last_run
  last_security_id = last_run.last_security_id
end

new_images = Security.where('id > ?', last_security_id)

image = new_images[0]
name_wo_folder = image.filename.split('/')[1]

s3 = Aws::S3::Resource.new(region:'us-west-2')
obj = s3.bucket(bucket_name).object(name_wo_folder)
obj.upload_file(image.filename)
