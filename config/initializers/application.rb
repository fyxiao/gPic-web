# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }

# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.
# Rails.backtrace_cleaner.remove_silencers!

require "instagram"

# These values are just for the development. Use new values when deploying elsewhere.

HOME_PAGE_URL = "http://127.0.0.1:3000"

Instagram.configure do |config|
  config.client_id = "7091673d229e4e93ad1889f79b0ef7f9"
  config.client_secret = "24e7a8bec7ac4972a43ab7c53fe72200"
end
