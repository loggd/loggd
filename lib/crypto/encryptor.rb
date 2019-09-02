module Crypto
  class Encryptor
    def initialize(cipher, key, text)
      @cipher = cipher
      @key = key
      @text = text
    end

    def call
      cipher.iv = iv
      cipher.key = key
      cipher.update(text) + cipher.final
    end

    def iv
      @iv ||= cipher.random_iv
    end

    private

      attr_reader :cipher, :key, :text
  end
end