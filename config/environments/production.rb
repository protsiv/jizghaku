Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  #config.serve_static_files = true

  #config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

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

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

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

  # replace this with your development tracker code
  GA.tracker = ENV['GA_TRACKER']

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'yizhaky.com.ua' }
  config.action_mailer.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: 587,
    domain: 'yizhaky.com.ua',
    user_name: ENV['SENDGRID_NAME'],
    password: ENV['SENDGRID_PASSWORD'],
    authentication: :plain,
    enable_starttls_auto: true
  }
end
