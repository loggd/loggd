module Crypto
  class CipherFactory
    def call
      OpenSSL::Cipher::AES256.new(:CBC)
    end
  end
end