Paperclip::Attachment.default_options.merge!({
  :storage => :s3,
  :s3_credentials => {
    bucket: "thebeansgroup",
    access_key_id: "AKIAJHD2Y5VLUTL3R3XA",
    secret_access_key: "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",
    s3_host_name: "s3-eu-west-1.amazonaws.com",
  },
  :s3_host_alias => "tbg.beanscdn.co.uk",
})