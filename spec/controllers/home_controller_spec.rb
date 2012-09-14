require "spec_helper"

describe HomeController do

  context "#index" do
    it "should respond ok" do
      get :index
      response.should be_ok
    end

    it "should render the application layout" do
      get :index

      response.should render_template('layouts/application')
    end
  end
end