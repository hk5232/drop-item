class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :item_set, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC').limit(8)
    @item = Item.all
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
    @item = Item.includes(:user).includes(:find).find(params[:id])
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
    gon.items = @items
    @map_items = []
    unless params[:mapMarkerData].nil?
      @map_items = params[:mapMarkerData]
      partial = render_to_string(partial: 'shared/list', locals: { map_items: @map_items })
      puts partial
      render json: { html: partial }
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
