module Crypto
  class SHA1Builder
    def initialize(pass, signing_key)
      @pass = pass
      @signing_key = signing_key
    end

    def call
      OpenSSL::PKCS5.pbkdf2_hmac_sha1(pass, signing_key, ITER, KEY_LEN)
    end

    private

      attr_reader :pass, :signing_key

      ITER = 20_000
      KEY_LEN = 32
  end
end
