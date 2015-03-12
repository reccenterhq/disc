require 'spec_helper'

describe Disc::Util do
  subject { described_class }

  it "converts a named array of hashes" do
    object = {'users' => [{'id' => 1}]}
    response = subject.convert_to_disc_object(object)
    expect(response).to be_a Disc::DiscObject
    expect(response.users.first).to be_a Disc::User
  end

  it "converts a hash by named key" do
    object = {'id' => 1}
    response = subject.convert_to_disc_object(object, key: 'users')
    expect(response).to be_a Disc::User
  end

  it "converts a nested named array of hashes" do
    object = {'users' => [{'id' => 1}],
              'topic_list' => { id: 1,
                               'topics' => [{id: 1}]
              }
    }
    response = subject.convert_to_disc_object(object)
    expect(response).to be_a Disc::DiscObject
    expect(response.users.first).to be_a Disc::User
    expect(response.topic_list).to be_a Disc::TopicList
    expect(response.topic_list.topics.first).to be_a Disc::Topic
  end

  it "falls back to disc object when no key available" do
    object = {'foobars' => [{'id' => 1}]}
    response = subject.convert_to_disc_object(object)
    expect(response).to be_a Disc::DiscObject
    expect(response.foobars.first).to be_a Disc::DiscObject
  end
end

