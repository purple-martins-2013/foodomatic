require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.create :user
  end

  subject { @user }

  it { should have_many(:queued_recipes) }
  it { should have_many(:basketed_recipes) }

  describe '#basket' do
    context 'with an empty basket' do
      it 'should return an empty list' do
        expect(@user.basket).to eq []
      end
    end

    context 'with some recipes in the basket' do
      before do
        @recipe = FactoryGirl.create :recipe
        FactoryGirl.create(:basketed_recipe, user: @user, recipe: @recipe)
      end

      it 'should return a list of Recipes (that are in the basket)' do
        expect(@user.basket).to eq [@recipe]
      end
    end
  end

  describe "#total" do
    let(:recipe) { FactoryGirl.create(:recipe_with_ingredients) }
    let(:basket) { [recipe] }
    let(:ingredient) { recipe.ingredients.first }
    let(:product) { recipe.ingredients.first.product }

    it "requires 1 argument" do
      expect { @user.total }.to raise_error(ArgumentError)
    end

    context "when there is 1 recipe in the basket" do
      it "calculates the total cost of the ingredients of the recipe in the basket" do
        expect(@user.total(basket)).to eq ingredient.amount_to_buy * product.price
      end
    end
  end

  describe "#add_to_basket" do

    before do
      @recipe = FactoryGirl.create :recipe
    end

    it "should add a recipe to the basket" do
      expect {subject.add_to_basket(@recipe) }.to change {subject.basket.size}.by 1
    end

    it "adds the right recipe to the basket" do
      subject.add_to_basket(@recipe)
      expect(subject.basket).to include(@recipe)
    end

  end

end

