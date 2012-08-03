require "spec_helper"

describe Pixelator do
  before do
    @orig_data = Pixelator.data
    @orig_file = Pixelator.config_file
    @orig_envs = Pixelator.run_envs
  end
  after do
    Pixelator.data = @orig_data
    Pixelator.config_file = @orig_file
    Pixelator.run_envs = @orig_envs
  end
  it "should be a module" do
    Pixelator.is_a?(Module).should be_true
  end

  it "should have data" do
    Pixelator.should be_respond_to(:data)
    Pixelator.data.should be_is_a(HashWithIndifferentAccess)
  end

  it "should have .run_envs with just production" do
    Pixelator.configure do |c|
      #do nothing
    end
    Pixelator.run_envs.should be_is_a(Array)
    Pixelator.run_envs.size.should == 1
    Pixelator.run_envs[0].should == 'production'
  end

  context ".configure" do
    def should_have_pixels(pixels)
      pixels.should be_is_a(Hash)
      pixels.should be_has_key(:all)
      pixels[:all].size.should == 1
      pixels[:all][0].keys.should include('name', 'type', 'snippet')
    end
    def should_have_context(c)
      c.should be_is_a(HashWithIndifferentAccess)
    end
    before do
      Pixelator.configure do |c|
        c.config_file = Rails.root.join('config', 'pixels.yml')
        c.run_envs << 'test'
      end
    end
    it "should have data.pixels" do
      Pixelator.data.should be_has_key(:pixels)
      pixels = Pixelator.data[:pixels]
      should_have_pixels(pixels)
    end

    it "should have data.context" do
      Pixelator.data.should be_has_key(:context)
      should_have_context(Pixelator.data[:context])
    end

    it "should respond to .pixels" do
      Pixelator.should be_respond_to(:pixels)
      should_have_pixels(Pixelator.pixels)
    end

    it "should respond to .context" do
      Pixelator.should be_respond_to(:context)
      should_have_context(Pixelator.context)
    end

    it "should set context via .context=" do
      expect {
        Pixelator.context[:stuff] = "stuff"
      }.to_not raise_error(StandardError)
      Pixelator.data[:context][:stuff].should == "stuff"
    end

    it "should have test env in run_envs" do
      Pixelator.run_envs.size.should == 2
      Pixelator.run_envs.should include('production', 'test')
    end
  end

end

