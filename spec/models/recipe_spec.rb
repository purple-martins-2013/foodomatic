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

  subject { @recipe }

  it { should respond_to :title }
  it { should respond_to :image_url }

  it { should have_many(:queued_recipes) }
  it { should have_many(:basketed_recipes) }

  it { should have_many(:products).through(:ingredients) }

end
