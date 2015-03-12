require 'spec_helper'

describe Disc do
  subject { described_class }

  before do
    Disc.api_key = 'fa74e75aaad7d20e2d1f7db3c129f992b47f922a9a86df6957ae7a9efe8f7842'
    Disc.api_username = 'eviltrout'
    Disc.api_url = 'http://localhost:4034'
  end

  it 'returns a client' do
    expect(subject.client).to be_instance_of DiscourseApi::Client
  end
end
end
