require 'spec_helper'

describe Disc::Topic do
  subject { described_class.new(json_for('a_topic.json')) }

  it 'has a title' do
    expect(subject.title).to eq "Test topic #1"
  end

  context "api requests" do
    subject { described_class }

    before do
      Disc.api_url = "http://localhost:3000"
      Disc.api_key = "key"
      Disc.api_username = "username"

      stub_get("http://localhost:3000/t/83.json?api_key=key&api_username=username").to_return(
        body: fixture("topic.json"),
        headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.find(83)
      expect(a_get("http://localhost:3000/t/83.json?api_key=key&api_username=username")).to have_been_made
    end

    it "returns the requested topics" do
      response = subject.find(83)
      expect(response).to be_a Disc::Topic
      expect(response.first).to be_a Disc::Post
    end
  end

  context "failing api request" do
    subject { described_class }

    before do
      Disc.api_url = "http://localhost:3000"
      Disc.api_key = "key"
      Disc.api_username = "username"

      stub_get("http://localhost:3000/t/bad_id.json?api_key=key&api_username=username").to_return(
        status: 404,
        headers: { content_type: "application/json" },
      )
    end

    it "raises a not found exception" do
      expect { subject.find("bad_id") }.to raise_error Disc::NotFound
      expect(a_get("http://localhost:3000/t/bad_id.json?api_key=key&api_username=username")).to have_been_made
    end
  end

end
