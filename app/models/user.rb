class User < ApplicationRecord
  devise \
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    authentication_keys: [:login]

  has_many :journals
  has_many :entries, through: :journals

  validates :handle, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_handle

  attr_writer :login

  def login
    @login ||= handle || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(handle) = :value OR lower(email) = :value", value: login.downcase).first
    elsif conditions.has_key?(:handle) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end

  private

    def validate_handle
      if User.where(email: handle).exists?
        errors.add(:handle, :invalid)
      end
    end
end
