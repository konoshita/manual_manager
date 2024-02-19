CarrierWave.configure do |config|
  if Rails.env.production? 
  config.fog_provider = 'fog/google'
  config.fog_credentials = {
    provider: 'Google',
    google_storage_access_key_id: ENV['GOOGLE_STRAGE_ACCSESS_KEY_ID'],
    google_storage_secret_access_key: ENV['GOOGLE_STRAGE_SECRET_ACCESS_KEY']
  }
    config.fog_directory = ENV['GCS_BUCKET']
  else # 本番環境以外の場合はアプリケーション内にアップロード
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end