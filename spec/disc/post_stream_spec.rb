
require 'spec_helper'

describe Disc::PostStream do

  context "api requests" do
    subject { described_class }

    before do
      Disc.api_url = "http://localhost:3000"
      Disc.api_key = "key"
      Disc.api_username = "username"

      stub_get("http://localhost:3000/t/25.json?api_key=key&api_username=username").to_return(
        body: fixture("topic.json"),
        headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.find(25)
      expect(a_get("http://localhost:3000/t/25.json?api_key=key&api_username=username")).to have_been_made
    end

    it "returns the requested topics" do
      response = subject.find(25)
      expect(response).to be_a Disc::PostStream
      expect(response.first).to be_a Disc::Post
    end
  end
end

