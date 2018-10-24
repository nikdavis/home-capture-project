require 'aws-sdk-s3'
require 'date'
require_relative './connection'
require_relative './s3_runs'
require_relative './security'

bucket_name = 'home-motion-capture'


last_security_id = 0
last_run = S3Runs.last
if last_run
  last_security_id = last_run.last_security_id
end

new_images = Security.where('id > ?', last_security_id)

exit if new_images.length == 0

current_run = S3Runs.new()
current_run.run_time = DateTime.now

new_images.each_with_index do |i, image|
  image = new_images[0]
  name_wo_folder = image.filename.split('/')[1]

  s3 = Aws::S3::Resource.new(region:'us-west-2')
  obj = s3.bucket(bucket_name).object(name_wo_folder)
  obj.upload_file('../' + image.filename)
  puts "Uploaded image #{i} of #{new_images.length}: #{image.name_wo_folder}"
end

current_run.last_security_id = new_images.last.id
current_run.save
