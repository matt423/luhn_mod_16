module LuhnMod16
  class CheckDigit
    attr_accessor :input

    def initialize(string)
      self.input = string
    end

    def check_digit
      array = (code_point_map @input).reverse
      array.map!.with_index do |int,i|
        next int unless i.even?
        doubled_hex = (int * 2).to_s(16)
        next int unless doubled_hex.index(/[^0-9]/).nil?
        doubled_hex.chars.sum &:to_i
      end
      reverse_code_point_map(16 - array.sum % 16)
    end

    private

    def code_point_map string
      string.chars.map &:hex
    end

    def reverse_code_point_map int
      int.to_s(16).upcase
    end
  end
end
