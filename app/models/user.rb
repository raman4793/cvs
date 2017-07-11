require 'openssl'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#   def key
#     encrypted_key
#   end
#
#   def key=(key)
#     encrypted_key=key
#   end
#
#
#
#   def encrypt(data)
# # create the cipher for encrypting
#     cipher = OpenSSL::Cipher.new('aes-256-cbc')
#     cipher.encrypt
#
# # you will need to store these for later, in order to decrypt your data
#
# # load them into the cipher
# #     k = cipher.random_key
#     k=Digest::SHA1.hexdigest("00001100 10001101 01110101 00011010 01110011 01101011 11101100 01110011
# 11000011 11100000 01001011 11001001 11000010 10011011 01100001 10011011
# 00110101 10111101 10010110 00000101 11000110 11101001 01011111 00111110
# 01010100 00001111 01010011 11001110 10001101 00110010 10101101 00101101")
#     puts("The kye #{k}")
#     v = cipher.random_iv
#     puts("The iv #{iv}")
#
#     cipher.key = k
#     cipher.iv = v
#
# # encrypt the message
#     encrypted = cipher.update(data) + cipher.final
#     # puts "encrypted: #{encrypted}\n"
#     # encrypted
#
#
#     decipher = OpenSSL::Cipher.new('aes-256-cbc')
#     decipher.decrypt
#     decipher.key = k
#     decipher.iv = v
#
# # and decrypt it
#     decrypted = decipher.update(encrypted) + decipher.final
#     # puts "decrypted: #{decrypted}\n"
#     # decrypted
#   end
#
#   def decrypt(data)
# # now we create a sipher for decrypting
#     decipher = OpenSSL::Cipher.new('aes-256-cbc')
#     decipher.decrypt
#     decipher.key = Digest::SHA1.hexdigest(updated_at.to_s)
#     decipher.iv = Digest::SHA1.hexdigest(created_at.to_s)
#
# # and decrypt it
#     decrypted = decipher.update(encrypted) + decipher.final
#     puts "decrypted: #{decrypted}\n"
#     decrypted
#   end

end
