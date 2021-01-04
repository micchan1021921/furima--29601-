require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
describe '商品出品' do

  context '商品登録がうまくいくとき' do
   it "image、name、info、category_id、sales_status_id、shippings_tee_status_id、prefecture_id、scheduled_delivary_id、priceが存在すれば登録できる" do
    expect(@item).to be_valid
    end
  end
  context '商品登録がうまくいかないとき' do
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "infoが空だと登録できない"do
      @item.info = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "sales_status_idが空だと登録できない"do
      @item.sales_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status can't be blank")
    end
    it "shippings_tee_status_idが空だと登録できない" do
      @item.shippings_tee_status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shippings tee status can't be blank")
    end
    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "scheduled_delivary_idが空だと登録できない" do
      @item.scheduled_delivary_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivary can't be blank")
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが全角数字の場合登録できない" do 
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが全角英字の場合登録できない" do 
      @item.price = "ａｉｕｅｏ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英字の場合登録できない" do
      @item.price = "aiueo"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceの数字が300以下だと登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end
    it "priceの数字が9999999以上だと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
  end


end
end