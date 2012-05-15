module Ems
  class Engine < ::Rails::Engine
    isolate_namespace Ems
    # Add a load path for this specific Engine
    config.autoload_paths << File.expand_path("#{Engine.root}/lib/query_builder/", __FILE__)
  end
end
