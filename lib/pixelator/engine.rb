module Pixelator
  class Engine < ::Rails::Engine

    initializer "pixelator.asset.pipeline" do |app|
      app.config.assets.precompile << 'pixelator_core.js'
    end

  end
end
