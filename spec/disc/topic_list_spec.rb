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

end
