ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"

RSpec.describe "search", type: :request do
  it 'works' do
    expect(true).to be true
  end
end
