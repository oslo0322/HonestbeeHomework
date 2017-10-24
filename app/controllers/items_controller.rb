class ItemsController < ApplicationController
    protect_from_forgery prepend: true

    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end
    
    def new
    end

    def create
        @item = Item.new(item_params)
        @item.save

        redirect_to @item
    end

    private
    def item_params
        params.require(:item).permit(:name, :price)
    end
end
