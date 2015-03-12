require 'spec_helper'

describe Disc::Topic do
  subject { described_class.new(json_for('a_topic.json')) }

  it 'has a title' do
    expect(subject.title).to eq "Test topic #1"
  end

end
