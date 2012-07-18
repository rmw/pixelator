require "spec_helper"

describe 'home/index' do

  it "should have pixelator_data" do
    render template: 'home/index', layout: "layouts/application"
    rendered.should include('<script src="/pixelator/data.js" type="text/javascript"></script>')
  end
end