require 'rails_helper'

RSpec.describe Trip, type: :model do
  it "has a valid factory" do
    expect(build(:trip)).to be_valid
  end

  let(:trip) { build(:trip) }

  describe "ActiveModel validations" do
    it { expect(trip).to validate_presence_of(:title) }
    it { expect(trip).to validate_presence_of(:city) }
    it { expect(trip).to validate_presence_of(:country) }
    it { expect(trip).to validate_presence_of(:description) }
  end

  describe "ActiveRecord associations" do
    it { expect(trip).to belong_to(:user) }
  end
end
