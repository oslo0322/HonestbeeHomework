class ItemsController < ApplicationController
    protect_from_forgery prepend: true

    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end
    
    def new
        if not current_user
            redirect_to new_user_session_path, notice: 'Permission Denied!'
        end
    end

    def create
        if current_user and current_user.role == 'admin'
            @item = Item.new(item_params)
            @item.save

            redirect_to @item
        else
            redirect_to new_user_session_path, notice: 'Permission Denied!'
        end
    end

    def order
        if current_user
            @order = Order.new({:user_id => current_user.id,
                                :item_id => params[:id],
                                :status => 'shopping_cart'})
            @order.save
            redirect_to '/items'
        else
            redirect_to new_user_session_path, notice: 'You are not logged in.'
        end
    end

    private
    def item_params
        params.require(:item).permit(:name, :price)
    end
end
