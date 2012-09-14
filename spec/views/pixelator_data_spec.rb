require "spec_helper"

describe 'pixelator/data' do

  it "should have PIXEL_DATA" do
    render
    rendered.should have_content('var PIXEL_DATA = {"pixels":{')
    rendered.should have_content('"all":[{"name":"')
    rendered.should have_content('"type":')
    rendered.should have_content('"snippet":')
    rendered.should have_content('"context":{"google_analytics":"GA_ACCOUNT"}')
  end
end