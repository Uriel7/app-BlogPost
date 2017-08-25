require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Association test
  it { belong_to(:post) }

  # Validation test
  it { should validate_presence_of(:content) }
end