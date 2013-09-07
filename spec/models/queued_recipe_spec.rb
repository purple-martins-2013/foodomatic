require 'spec_helper'

describe QueuedRecipe do

  before do
    @queued_recipe = QueuedRecipe.new
  end

  subject { @queued_recipe }

  it { should belong_to :user }
  it { should belong_to :recipe }

  describe "assign position" do
    let(:user) { User.create }
    let(:qr) { QueuedRecipe.create(user: user) }

    it "should assign a position before creating" do
      expect(qr.position).to eq user.last_position
    end
  end
end
