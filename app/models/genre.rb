class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
#   has_many :関連名, through: :items
#   has_many :items
end
