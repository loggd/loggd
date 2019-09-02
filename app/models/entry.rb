require 'crypto'

class Entry < ApplicationRecord
  belongs_to :journal

  attr_accessor :decrypted_body

  scope :latest, -> { order(created_at: :desc) }

  def decrypted_body?
    decrypted_body.present?
  end

  def decrypt!(pass)
    self.decrypted_body = Crypto::Decryptor.new(cipher_builder.decryption_cipher, sha1(pass), iv, body).call
  end

  def encrypt!(pass)
    encryptor = Crypto::Encryptor.new(cipher_builder.encryption_cipher, sha1(pass), body)
    self.body = encryptor.call
    self.iv = encryptor.iv
  end

  private

    delegate :sha1, to: :cipher_builder

    def cipher_builder
      Crypto::CipherBuilder.new(Rails.application.credentials[:signing_key])
    end
end
