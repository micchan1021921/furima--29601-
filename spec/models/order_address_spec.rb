require 'rails_helper'
describe OrderAddress do
  before do
    @user =FactoryBot.create(:user)
    @item =FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id: @user.id, item_id: @item.id)
    sleep 1
  end
describe '商品購入' do

  context '商品購入がうまくいくとき' do
    it "postal_code、prefecture_id、city、address、phone_number、tokenが存在すれば購入できる" do
      expect(@order_address).to be_valid
    end
    it "buildingが空でも購入できる" do
      expect(@order_address).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do
    it "postal_codeが空だと購入できない" do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeに(-)がないと購入できない" do
      @order_address.postal_code = "12345678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it "prefecture_idが空だと購入できない" do
       @order_address.prefecture_id = ""
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "prefecture_idが1だと購入できない" do
       @order_address.prefecture_id = "1"
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "cityが空だと購入できない" do
       @order_address.city = ""
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空だと購入できない" do
       @order_address.address = ""
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberが空だと購入できない" do
       @order_address.phone_number = ""
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberが11桁を超えると購入できない" do
       @order_address.phone_number = "123456789123"
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberに(-)をいれると購入できない" do
       @order_address.phone_number = "123-4567-12"
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが全角数字だと購入できない" do
       @order_address.phone_number = "１２３４５６７８９１２"
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが9桁以下だと購入できない" do
       @order_address.phone_number = "123456789"
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it "tokenが空では購入できない"do
       @order_address.token = nil
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it "user_idが空では購入できない"do
       @order_address.user_id = ""
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では購入できない"do
       @order_address.item_id = ""
       @order_address.valid?
       expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end

end
end