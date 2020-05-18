class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :bill

end
