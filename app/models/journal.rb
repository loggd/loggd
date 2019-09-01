class Journal < ApplicationRecord
  has_secure_password validations: false
  validates_presence_of :password, unless: :public?

  belongs_to :user
  has_many :entries

  scope :recent_entries, -> { order(create_at: :desc) }
  scope :alphabetical, -> { order(name: :asc) }
end
