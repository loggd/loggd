module Crypto
  class CipherBuilder
    def call
      CipherFactory.new.call.encrypt
    end
  end
end