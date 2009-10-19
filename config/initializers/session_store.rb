# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fbops_session',
  :secret      => '0f009eb7d22b59f6fe05786eb612c0d1b2f2473f2f3fc18c9595df802ef7d9d219ac2df7d5e8bf78910315f171725e45497b1f0da042625c4e0c3d6d84f58300'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
