# Gestión de Errores por Mail
PiensaQue::Application.config.middleware.use ExceptionNotification::Rack,
:email => {
  :email_prefix => "[PiensaQue] ",
  :sender_address => %{"[PiensaQue] Production Error" <piensaque.com@gmail.com>},
  :exception_recipients => %w{sergiocc14.12@gmail.com}
}

PiensaQue::Application.configure do
  # Paperclip AWS
  config.paperclip_defaults = {
    :storage => :s3,
    :s3_credentials => {
      :bucket => ENV['AWS_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => ENV['SMTP_ADDRESS'],
    :authentication => :login,
    :user_name => ENV['SMTP_USERNAME'],
    :password => ENV['SMTP_PASSWORD'],
    :enable_starttls_auto => true,
    :port => 25
  }
  
  # config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false

  # Habilita la subida de assets con assets_sync
  config.action_controller.asset_host = "//s3.amazonaws.com/public.piensaque.com"

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = true

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true


  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  # config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
