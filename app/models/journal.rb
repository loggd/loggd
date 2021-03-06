class Journal < ApplicationRecord
  has_secure_password validations: false
  validates_presence_of :password, unless: :public?, on: :create

  belongs_to :user
  has_many :entries
  has_and_belongs_to_many :reminders

  scope :recent_entries, -> { order(create_at: :desc) }
  scope :alphabetical, -> { order(name: :asc) }
  scope :public_books, -> { where(public: true) }
end
