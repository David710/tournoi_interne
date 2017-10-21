class Group < ApplicationRecord
  has_many :players
  has_many :matches
end
