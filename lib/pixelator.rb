require 'rails'
require "pixelator/engine"


module Pixelator
  autoload :PixelatorController, 'pixelator/controllers/pixelator_controller'

  class << self
    attr_accessor :data
    attr_accessor :config_file
    attr_accessor :run_envs
  end

  def self.configure
    self.run_envs = ['production']
    yield(self) if block_given?
    self.data = HashWithIndifferentAccess.new
    self.data[:pixels] = YAML.load_file(config_file).with_indifferent_access
    self.data[:pixels].each do |k,v|
      if v.is_a?(Array)
        v.map! do |a|
          a['snippet'] = URI.escape(a['snippet'])
          a
        end
      end
    end
    self.data[:context] = HashWithIndifferentAccess.new
  end

  def self.pixels
    data[:pixels]
  end

  def self.context
    data[:context]
  end
end
