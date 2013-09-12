require 'spec_helper'

describe Recipe do

  before do
    @recipe = FactoryGirl.create :recipe
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }

    describe 'image_url' do
      it { should validate_presence_of :image_url }

      it 'should accept valid urls' do
        @recipe.image_url = 'http://www.foo.com/foo.jpg'
        expect(@recipe).to be_valid
      end

      it 'should not accept invalid urls' do
        @recipe.image_url = 'www.'
        expect(@recipe).not_to be_valid
      end
    end

  end

  describe "search" do
    context "when search term is nil" do
      it "returns all the recipes" do
        expect(Recipe.search(nil)).to eq Recipe.all
      end
    end

    context "when there is 1 search term" do
      it "returns recipes where the title includes the search term" do
        expect(Recipe.search('steak')).to eq [@recipe]
      end
    end

    context "when there is more than 1 search term" do
      before do
        @recipe_2 = Recipe.create(title: 'Fried Chicken', image_url: 'http://www.friedchicken.com')
      end

      it "returns recipes where the title includes all the search terms, regardless of order" do
        expect(Recipe.search('chicken fried')).to eq [@recipe_2]
      end
    end
  end

  subject { @recipe }

  it { should respond_to :title }
  it { should respond_to :image_url }

  it { should have_many(:favorite_recipes) }
  it { should have_many(:basketed_recipes) }

  it { should have_many(:products).through(:ingredients) }

end
