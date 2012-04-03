notification :growl
# This does not work atm because it needs to invoke the server as the dummy app
#guard :rails do
#  watch('Gemfile.lock')
#  watch(%r{^(config|lib)/.*})
#end

guard :haml, :output => 'app/assets/javascripts/ems/views/.src', :input => 'app/assets/javascripts/ems/views/' do
  watch %r{^app/assets/javascripts/ems/views/.+(\.html\.haml)}
end