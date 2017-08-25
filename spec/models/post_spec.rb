require 'rails_helper'

RSpec.describe Post, type: :model do
  # Association test
  it { should have_many(:comments).dependent(:destroy) }

  # Validations test
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end