class Bill < ApplicationRecord
  belongs_to :customer
  has_one :invoice
end
