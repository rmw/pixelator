require "spec_helper"

describe 'home/index' do

  it "should include pixelator/data.js script tag" do
    render template: 'home/index', layout: "layouts/application"
    rendered.should include('<script src="/pixelator/data.js" type="text/javascript"></script>')
  end

  it "should include Pixelator.run code" do
    render
    rendered.should include("new Pixelator(PIXEL_DATA, '');")
    rendered.should include("pixelator.run")
  end
end
