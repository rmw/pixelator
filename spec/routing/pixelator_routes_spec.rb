require "spec_helper"

describe "Pixelator Routing" do

  it "should route pixelator/data" do
    assert_routing({ path: "pixelator/data", method: :get},
                   { controller: "pixelator", action: "data" }
    )
  end

end