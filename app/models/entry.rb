require 'crypto'

class Entry < ApplicationRecord
  belongs_to :journal

  attr_accessor :decrypted_body

  scope :latest, -> { order(created_at: :desc) }

  def decrypted_body?
    decrypted_body.present?
  end

  def decrypt!(pass)
    self.decrypted_body = Crypto::Decryptor.new(decipher, sha1(pass), iv, body).call
  end

  def encrypt!(pass)
    encryptor = Crypto::Encryptor.new(cipher, sha1(pass), body)
    self.body = encryptor.call
    self.iv = encryptor.iv
  end

  private

    def decipher
      Crypto::DecipherBuilder.new.call
    end

    def cipher
      Crypto::CipherBuilder.new.call
    end

    def sha1(pass)
      Crypto::SHA1Builder.new(pass, Rails.application.credentials[:signing_key]).call
    end
end
