require 'spec_helper'

describe Recipe do

  before do
    @recipe = Recipe.new(title: 'my great recipe', image_url: 'http://www.neontommy.com/sites/default/files/uploads/moretonfigsteak.JPG')
  end

  subject { @recipe }

  it { should respond_to :title }
  it { should respond_to :image_url }

  

end
