notification :growl

# guard :rails do
#  watch('Gemfile.lock')
#  watch(%r{^(config|lib)/.*})
# end

guard 'coffeescript', :output => 'public/javascripts/compiled' do
  watch('^app/assets/javascripts/(.*)\.coffee')
end

guard 'coffeescript', :output => 'spec/javascripts' do
  watch('^spec/coffeescripts/(.*)\.coffee')
end

# guard 'livereload' do
#   watch('^spec/javascripts/.+\.js$')
#   watch('^public/javascripts/compiled/.+\.js$')
# end