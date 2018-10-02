require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Pins" do
  get "/pins" do
    example "pins" do
      do_request

      status.should == 200
    end
  end
end