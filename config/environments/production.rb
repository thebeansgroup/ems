Ems::Engine.configure do
  # Paperclip S3 config
  PAPERCLIP_STORAGE_OPTIONS = {
    :storage => :s3,
    :s3_credentials => "#{Ems::Engine.root}/config/s3.yml",
    :path => ":attachment/:filename",
    :s3_host_alias => "tbg.beanscdn.co.uk",
    :url => ":s3_alias_url"
  }
end
