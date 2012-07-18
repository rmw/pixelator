require "spec_helper"

describe PixelatorController do

  def get_data
    get :data, format: :js
  end

  it "should return successfully" do
    get_data
    response.should be_ok
    assert_template 'pixelator/data'
  end

  it "should return js" do
    get_data
    response.headers['Content-Type'].should == "text/javascript; charset=utf-8"
  end

end