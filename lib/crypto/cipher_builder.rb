module Crypto
  class CipherBuilder
    def initialize(signing_key)
      @signing_key = signing_key
    end

    def sha1(pass)
      OpenSSL::PKCS5.pbkdf2_hmac_sha1(pass, signing_key, ITER, KEY_LEN)
    end

    def encryption_cipher
      create_aes256_cbc_cipher.encrypt
    end

    def decryption_cipher
      create_aes256_cbc_cipher.decrypt
    end

    private

      ITER = 20_000
      KEY_LEN = 32

      attr_reader :signing_key

      def create_aes256_cbc_cipher
        OpenSSL::Cipher::AES256.new(:CBC)
      end
  end
end