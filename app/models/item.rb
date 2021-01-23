class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shippings_tee_status
  belongs_to :sales_status
  belongs_to :prefecture
  belongs_to :scheduled_delivary
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, format:{ with: /\A[0-9]+\z/i }, numericality:{ only_integer: true,greater_than: 299, less_than: 10000000 }
  with_options numericality: { other_than: 1 }do
    validates :category_id
    validates :sales_status_id
    validates :shippings_tee_status_id
    validates :prefecture_id
    validates :scheduled_delivary_id
  end
  end

end
