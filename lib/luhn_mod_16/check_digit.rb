module LuhnMod16
  class CheckDigit
    attr_accessor :string

    def initialize(string)
      self.string = string
    end

    def check_digit
      (16 - sum_reduced_characters) % 16
    end

    private

    def code_mapped
      self.string.chars.map { |character| character.hex }
    end

    def double_alternate_characters
      mapped = code_mapped.reverse
      (0..mapped.length - 1).step(2).map do |index|
        mapped_character = mapped[index]
        next unless mapped_character > 0

        converted_character = (mapped_character * 2).to_i.to_s(16)
        mapped[index] = converted_character if converted_character.to_i != 0
      end
      mapped.reverse.map &:to_s
    end

    def reduced_doubled_characters
      mapped = double_alternate_characters.reverse
      (0..mapped.length - 1).step(2).map do |index|
        mapped[index] = mapped[index].split('').map(&:to_i).sum
      end

      mapped.reverse
    end

    def sum_reduced_characters
      reduced_doubled_characters.map(&:to_i).sum
    end

    def reversed_string
      string.reverse
    end

    def split_string
      self.string.chars
    end
  end
end
