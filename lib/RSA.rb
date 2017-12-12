require 'prime'

class RSA
   #attr_accessor :n , :e , :d

   def initialize n, e, d
     @n = n
     @e = e
     @d = d
     #initializes this instance of RSA with a n,e and d variables of type int. 'n','e' are the public key and 'd' is the private one. This n,e,d should be used when encrypting and decrypting the message
   end

   def n
      @n
      #returns the value of 'n' passed in the initialize
   end

   def e
      @e
      #returns the value of 'e' passed in the initialize
   end

   def d
      @d
      #returns the value of 'd' passed in the initialize
   end

   def new_key
     p = 4
     q = 4
     while(!PRIME.prime?(p) || !PRIME.prime?(q) ) do
       p = rand (10..99)
       q = rand (10..99)
     end
     @n = p * q
     lambda = (p-1).lcm((q-1))

      while(!PRIME.prime?(@e)) do
        @e = rand (0..lambda)
      end

      @d = e**(-1) % lambda

      new_values = Array.new
      new_values.push(@n)
      new_values.push(@e)
      new_values.push(@d)

      new_values
      #generates a new 'n','e' and 'd' values following the RSA algorithm. Returns a new array of three elements where the first element is 'n', the second is 'e' and the third is 'd'. Each time it is called a new key must be returned.
   end

   def encrypt message
      message = "message"
      #@e=17
      #@n=3233
      byte = []
      ms = []
      crypt = []

      message.each_char do |c|
        byte << c.ord
      end

      byte.each do |b|

        if b.to_s.length < 3
          ms << "0"+b.to_s
        else
          ms << b
        end
       end

       ms.each do |b|
         crypt << c = b.to_i**@e % @n
       end

     crypt
      #encrypts the message passed. The message is of type string. Encrypts each symbol of this string by using its ASCII number representation and returns the encrypted message.
   end

   def decrypt message

    #  @n=3233
    #  @d=14

      m = ""
      message.each do |c|
        m += (c**d % n).to_i.chr
      end
       m
      #decrypts the message passed. The message is of type string. Decrypts each symbol of this string Encrypts each symbol of this string by using its ASCII number representationand returns the decrypted message.
    end
end
