require 'spec_helper'

describe BasketController do

  context 'for a user that is logged in' do

    before do
      @user = FactoryGirl.create :user
      sign_in @user
    end

    describe "#show" do

      it "returns a list of the current_user's basket" do
        get :show
        expect(assigns(:basket)).to eq @user.basket
      end

      it "returns a list of the current_user's basket" do
        get :show
        expect(response).to render_template('show')
      end

    end
  end
end
