class Member < ApplicationRecord
  belongs_to :account

  has_many :addresses
end
