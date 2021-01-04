require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品機能' do
  context '出品登録がうまくいくとき' do
    it "image、name、info、category_id、sales_status_id、shippings_tee_status_id、prefecture_id、scheduled_delivary_id、priceが存在すれば登録できる" do
      expect(@item).to be_valid
    end
  end
end