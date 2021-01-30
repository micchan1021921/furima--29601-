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
    it "postal_code、prefecture_id、city、address、phone_numberが存在すれば登録できる" do
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
  end

end
end