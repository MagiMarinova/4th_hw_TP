require 'RSA'

values = RSA.new(3233,17,413)

describe RSA do
  describe "returning values of n,e and d" do
    it "returns n" do
      expect(values.n).to eq 3233
    end

    it "returns e" do
      expect(values.e).to eq 17
    end

    it "returns d" do
      expect(values.d).to eq 413
    end
  end

  describe "new_key" do
    it "creates new key" do
      expect(values.new_key.length).to eq 3
    end
  end

  describe "encrypt" do
    it "encrypts the message" do
      expect(values.encrypt("hello").length).to eq 7
    end
  end

  describe "decrypt" do
    it "decrypts the message" do
      msg = values.encrypt("hello")
      expect(values.decrypt(msg).length).to eq 7
    end
  end
end
