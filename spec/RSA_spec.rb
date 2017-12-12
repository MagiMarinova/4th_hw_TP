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
end
