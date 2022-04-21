class FindsController < ApplicationController
  before_action :item_set, only: [:index, :create]
  before_action :skip_user, if: proc { user_signed_in? && current_user.id == @item.user.id }

  def index
    @find = Find.new
    if @item.find.present?
      redirect_to root_path
      return
    end

    redirect_to root_path unless user_signed_in?
  end

  def create
    @find = Find.new(find_params)
    if @find.valid?
      @find.save
      @item.update_attribute(:latitude, 'nil')
      @item.update_attribute(:studios, 'nil')
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_params
    params.require(:find).permit(:comment).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def skip_user
    redirect_to root_path
  end
end
