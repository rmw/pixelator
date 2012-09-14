require 'spec_helper'
require 'pry'

describe 'shared/_pixelator_head' do
  it "should render a script tag" do
    render
    rendered.should have_selector('script')
  end

  it "should render the code" do
    render
    rendered.should have_content('var _gaq = _gaq || [];')
  end

  it "should replace google_analytics with the context" do
    render
    rendered.should have_content("_gaq.push(['_setAccount', 'GA_ACCOUNT']);")
    rendered.should_not have_content('<%= google_analytics %>')
  end
end