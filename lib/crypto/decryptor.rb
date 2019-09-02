module Crypto
  class Decryptor
    def initialize(decipher, key, iv, encrypted_text)
      @decipher = decipher
      @key = key
      @iv = iv
      @encrypted_text = encrypted_text
    end

    def call
      decipher.iv = iv
      decipher.key = key
      decipher.update(encrypted_text) + decipher.final
    end

    private

      attr_reader :decipher, :key, :iv, :encrypted_text
  end
end