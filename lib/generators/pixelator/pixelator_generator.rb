class PixelatorGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer_file
    copy_file "pixelator.rb", "config/initializers/pixelator.rb"
  end

  def copy_pixel_yaml
    copy_file "pixels.yml", "config/pixels.yml"
  end
end
