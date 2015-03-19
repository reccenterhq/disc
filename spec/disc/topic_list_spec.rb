require 'spec_helper'

describe Disc::TopicList do
  subject { described_class.new(json_for('latest.json')) }

  it 'has a root' do
    expect(subject.root).to eq :topic_list
  end

  it 'returns topics' do
    expect(subject.first).to be_a Disc::Topic
  end

  it 'returns users' do
    expect(subject.users.first).to be_a Disc::User
  end

  it 'returns values' do
    expect(subject.values[0]).to be_a Disc::Topic
  end

  context "api requests" do
    subject { described_class }

    before do
      Disc.api_url = "http://localhost:3000"
      Disc.api_key = "key"
      Disc.api_username = "username"

      stub_get("http://localhost:3000/latest.json?api_key=key&api_username=username").to_return(
        body: fixture("latest.json"),
        headers: { content_type: "application/json" })
    end

    it "requests the correct resource" do
      subject.latest
      expect(a_get("http://localhost:3000/latest.json?api_key=key&api_username=username")).to have_been_made
    end

    it "returns the requested topics" do
      response = subject.latest
      expect(response).to be_a Disc::TopicList
      expect(response.first).to be_a Disc::Topic
    end
  end
end
