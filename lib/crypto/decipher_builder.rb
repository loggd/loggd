module Crypto
  class DecipherBuilder
    def call
      CipherFactory.new.call.decrypt
    end
  end
end