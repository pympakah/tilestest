class Invoice < ApplicationRecord
  has_one :customer
  belongs_to :bill

end
