require "spec_helper"

describe HomeController do

  it "should go to #index" do
    get :index
    response.should be_ok
  end
end