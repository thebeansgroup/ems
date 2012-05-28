# Needed to pass on pluralisation exceptions
ActiveSupport::Inflector.inflections do |inflect|
  # Make sure we tell rails about series exception
  # "series".pluralize    #=> "series"
  # "series".singularize  #=> "series"
  inflect.uncountable 'series'

end

# Make sure all assets are precompiled
initializer "ems.assets.precompile" do |app|
  app.config.assets.precompile += %w(application.css application.js)
end
