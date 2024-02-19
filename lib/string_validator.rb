# frozen_string_literal: true

# lib/string_validator.rb
module StringValidator
  def self.numeric?(string)
    string.match?(/\A\d+\z/)
  end
end
