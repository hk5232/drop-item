require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '落とし物出品' do
    context '落とし物出品できる場合' do
      it '必須項目が全てあれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'addressが空では保存できない' do
        @item.address = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Address can't be blank")
      end

      it 'latitudeが空では保存できない' do
        @item.latitude = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Latitude can't be blank")
      end

      it 'studiosが空では保存できない' do
        @item.studios = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Studios can't be blank")
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
