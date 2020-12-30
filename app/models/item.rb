class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :ahippings_tee_status, :prefecture, :scheduled_delivary
end

