require "economic-ocr/version"

module Economic
  class InvalidOcr < StandardError; end
  class Ocr
    def self.calculate(number)
      return unless number
      value = "#{ number }0" # E-conomic wants us to add a 0 for some reason.
      value += ((value.length + 2) % 10).to_s # 2 for length and check.
      (value + luhn_checksum(value).to_s).to_i
    end

    def self.id_from_ocr(ocr)
      return unless ocr
      ocr.to_s[0..-4].to_i
    end

    def self.id_from_ocr!(ocr)
      ocr = ocr.to_i
      number = id_from_ocr(ocr)

      if calculate(number) == ocr
        number
      else
        raise InvalidOcr, "Invalid OCR: #{ocr}"
      end
    end

    private

    def self.luhn_checksum(number)
      digits = number.to_s.reverse.scan(/\d/).map { |x| x.to_i }
      digits = digits.each_with_index.map { |d, i|
        d *= 2 if i.even?
        d > 9 ? d - 9 : d
      }
      sum = digits.inject(0) { |m, x| m + x }
      mod = 10 - sum % 10
      mod == 10 ? 0 : mod
    end
  end
end
