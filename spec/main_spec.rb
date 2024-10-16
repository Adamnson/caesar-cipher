require "./lib/main"

describe "#show_caesar_cipher" do
  it "returns same string if cipher_shift is 0" do
    expect(show_caesar_cipher("a", 0)).to eql("a")
  end
end
