# -*- encoding : utf-8 -*-
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
    :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'    
    :host                   => "s3.amazonaws.com",
    :endpoint               => "http://s3.amazonaws.com" , # optional, defaults to nil
    :path_style             => true


  }
  config.fog_directory  = ENV['AWS_S3_BUCKET']             # required
  config.fog_public     = true                            # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
