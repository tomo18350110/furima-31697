require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it "imageとitem_nameとexplanationとcategory_idとcondition_idとshipping_charges_idとshipping_area_idとdays_to_ship_idとitem_priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
      it "価格の範囲が、¥300~¥9,999,999の間であると出品できる" do
        @item.item_price = '9999999'
        expect(@item).to be_valid
      end
      it "価格の範囲が、¥300~¥9,999,999の間であると出品できる" do
        @item.item_price = '300'
        expect(@item).to be_valid
      end
      it "販売価格は半角数字のみ保存可能であること"
    end

    context '商品出品機能がうまくいかないとき' do
      it "item_nameが空だと出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "explanationが空だと出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと出品できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_charges_idが空だと出品できない" do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end
      it "shipping_area_idが空だと出品できない" do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "days_to_ship_idが空だと出品できない" do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "item_priceが空だと出品できない" do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
    end
  end
end