class User < ApplicationRecord
  has_many :journals
  has_many :entries, through: :journals
end
