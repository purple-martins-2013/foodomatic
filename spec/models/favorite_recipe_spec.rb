require 'spec_helper'

describe FavoriteRecipe do

  before do
    @favorite_recipe = FavoriteRecipe.new
  end

  subject { @favorite_recipe }

  it { should belong_to :user }
  it { should belong_to :recipe }

  describe "assign position" do
    let(:user) { User.create }
    let(:favorite_recipe) { FavoriteRecipe.create(user: user) }

    it "should assign a position before creating" do
      expect(favorite_recipe.position).to eq user.last_position
    end
  end
end
