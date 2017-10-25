require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do
  describe "GET #index" do
    it "should assgins all items to @items" do
      item = Item.create(name: "Test Item1", price: 10)
      get :index
      expect(assigns(:items)).to eq [item]
    end
  end
end