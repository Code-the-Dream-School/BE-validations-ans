class Order < ApplicationRecord
  belongs_to :customer
  validates :product_count, numericality: { only_integer: true }
  validates_presence_of :customer
  validates_presence_of :product_name
  validates_presence_of :product_count
  validates_associated :customer
end
