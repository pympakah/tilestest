class Bill < ApplicationRecord
  has_one :customer
  belongs_to :invoice
end
