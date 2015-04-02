Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['fb_app_id'], ENV['fb_secret']
           # :scope => 'email, first_name, last_name, image', :display => 'popup'
end