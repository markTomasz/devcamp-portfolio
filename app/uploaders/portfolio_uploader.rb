class PortfolioUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # white list of extensions which are allowed to be uploaded
  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
