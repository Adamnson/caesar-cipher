require "./lib/main"

describe "#show_caesar_cipher" do
  it "returns same string if cipher_shift is 0" do
    expect(show_caesar_cipher("a", 0)).to eql "a"
    expect(show_caesar_cipher("A", 0)).to eql "A"
  end

  it "returns doesn't alter the case" do
    str = "abcde fghij klmno pqrst uvwxy z"
    res = show_caesar_cipher(str, 5)
    expect(show_caesar_cipher(str.upcase, 5)).to eql res.upcase
  end

  it "returns nil for negative shifts" do
    expect(show_caesar_cipher("b", -1)).to be_nil
  end

  it "does not alter special characters" do
    str = " !@#$%^&*(){}[],./|~"
    expect(show_caesar_cipher(str, 10)).to eql str
  end

  it "does not alter digits" do
    str = "0123456789"
    expect(show_caesar_cipher(str, 15)).to eql str
  end
end
