require 'spec_helper'

describe QueuedRecipe do

  before do
    @queued_recipe = QueuedRecipe.new
  end

  subject { @queued_recipe }

  it { should belong_to :user }
  it { should belong_to :recipe }

  describe "set priority" do
    let(:user) { User.create }
    let(:qr) { QueuedRecipe.create(user: user) }

    it "should assign a priority number before saving" do
      expect(qr.priority).to eq user.next_priority
    end
  end
end
