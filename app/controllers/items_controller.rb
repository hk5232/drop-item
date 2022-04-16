class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :item_set, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC').limit(8)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.find.present?
      redirect_to action: :index
      return
    end

    if !user_signed_in?
      redirect_to new_user_session_path
    elsif user_signed_in? && !(current_user == @item.user)
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    end
  end

  def search
    @items = Item.all
    if params[:location].present?
    results = Geocoder.search(params[:location])
        # 北から南、東から西の範囲をつくる
        lat = Range.new(*[params["north"], params["south"]].sort{|a,b|a.to_i <=> b.to_i})
        lon = Range.new(*[params["east"], params["west"]].sort{|a,b|a.to_i <=> b.to_i})
        # データ取得
        @items = Item.near(results.first.coordinates, 20).page(params[:page]).per(10)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :address, :image, :color, :feature, :latitude,
                                 :studios).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end
end
