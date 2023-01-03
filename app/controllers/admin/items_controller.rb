class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @genre_id = Genre.find_by(code: params[:item][:genre_id]).id
    Production.create(genre_params.merge(item_id: item_id))
  end

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:amount)
  end
  
end
