require 'spec_helper'

describe Teaple, type: :model do
  it { is_expected.to have_many :messages }
end