require 'openssl'
module Cryptor
  #  Chiper Types: "AES-256-CBC", "AES-256-ECB", But you can use all types you want, just write in terminal: openssl list-cipher-commands and choose.
  # output is string if everything is alright.

  @key = "azxcfhyjul1%fzx)fzs!@flp[CaaseklQFcz" #Example key for AES 256

  def self.aes_256_cbc_encrypt(data,key=nil)
    chiper_method = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
    chiper_method.encrypt
    current_key = key ? key : @key
    chiper_method.key = current_key
    chiper_method.update(data) + chiper_method.final
  end

  def self.aes_256_cbc_decrypt(data,key=nil)
    chiper_method = OpenSSL::Cipher::Cipher.new("AES-256-CBC")
    chiper_method.decrypt
    current_key = key ? key : @key
    chiper_method.key = current_key
    chiper_method.update(data) + chiper_method.final
  end

  def self.decrypt(encrypted_data, key, iv=nil, cipher_type)
    chiper_method = OpenSSL::Cipher::Cipher.new(cipher_type)
    chiper_method.decrypt
    chiper_method.key = key
    chiper_method.iv = iv if iv
    chiper_method.update(encrypted_data) + chiper_method.final
  end

  def self.encrypt(data, key, iv=nil, cipher_type)
    chiper_method = OpenSSL::Cipher::Cipher.new(cipher_type)
    chiper_method.encrypt
    chiper_method.key = key
    chiper_method.iv = iv if iv
    chiper_method.update(data) + chiper_method.final
  end

 #### Attention! if key is too short for your method you'll see an error
end
