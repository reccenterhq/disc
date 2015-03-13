require 'spec_helper'

describe Disc::DiscObject do
  let(:object) { {'foobars' => [{'id' => 1}]} }

  subject { described_class.new(object) }

  it 'puts to_s' do
    puts subject.to_s
  end

end
