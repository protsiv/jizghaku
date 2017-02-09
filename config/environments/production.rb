Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.serve_static_assets = true

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  #config.assets.debug = true

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  #config.assets.css_compressor = :sass


  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.  :info, :debug
  config.log_level = :info

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  #config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  #config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  Paperclip.options[:command_path] = "/usr/local/bin/"

  ENV["FACEBOOK_CONSUMER_KEY"] = "849830535062555"
  ENV["FACEBOOK_CONSUMER_SECRET"] = "49c4a8f9e3d0ad623325a39614f987a3"

  # replace this with your development tracker code
  GA.tracker = "UA-63240701-1"

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  #config.action_mailer.perform_deliveries = true

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'yizhaky.com.ua' }
  config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      #:domain               => "voroninstudio.eu",
      #:user_name            => "support@voroninstudio.eu",
      #:password             => "Studiosupport123",
      user_name: "partido12@gmail.com",
      password:  "pasha1991",
      :authentication       => :plain,
      :enable_starttls_auto => true
  }
end
