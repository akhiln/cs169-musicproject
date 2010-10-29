# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jukebox_session',
  :secret      => '07e9da4417e897555878dd13b7f778e49ee7da948f35a05a7f7eb61d6cb418d6b7c9417833aa41467206afe9564c76457ab5747ace0d826b1248c3ab09c9a378'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
