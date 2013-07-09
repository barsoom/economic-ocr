require "minitest/autorun"
require "minitest/pride"
require "economic-ocr"

describe Economic::Ocr, "self.calculate" do

  it "is the ID + 0 + length + checksum" do
    Economic::Ocr.calculate(77).must_equal 77057
    Economic::Ocr.calculate(78).must_equal 78055
    Economic::Ocr.calculate(123).must_equal 123067
    Economic::Ocr.calculate(1234).must_equal 1234079
    Economic::Ocr.calculate(1234567890).must_equal 1234567890037
  end

  it "returns nil when given nil" do
    Economic::Ocr.calculate(nil).must_equal nil
  end

end

describe Economic::Ocr, "self.id_from_ocr" do

  it "returns the id" do
    Economic::Ocr.id_from_ocr(77057).must_equal 77
    Economic::Ocr.id_from_ocr(78055).must_equal 78
    Economic::Ocr.id_from_ocr(123067).must_equal 123
    Economic::Ocr.id_from_ocr(1234079).must_equal 1234
    Economic::Ocr.id_from_ocr(1234567890037).must_equal 1234567890
  end

  it "returns nil when given nil" do
    Economic::Ocr.id_from_ocr(nil).must_equal nil
  end

end

describe Economic::Ocr, "self.id_from_ocr!" do
  it "returns an id when valid" do
    Economic::Ocr.id_from_ocr!(1234567890037).must_equal 1234567890
  end

  it "handles strings" do
    Economic::Ocr.id_from_ocr!("1234567890037").must_equal 1234567890
  end

  it "raises an error when not valid" do
    -> { Economic::Ocr.id_from_ocr!(123) }.must_raise Economic::InvalidOcr
  end
end

