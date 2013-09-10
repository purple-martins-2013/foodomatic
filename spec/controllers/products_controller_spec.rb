require 'spec_helper'

describe ProductsController do

  describe '#index' do
    it 'returns JSON object containing all the products' do
      FactoryGirl.create :product
      get :index
      expect(response.body).to eq Product.all.to_json
    end
  end

end
