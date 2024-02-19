# lib/string_validator.rb
module StringValidator
  def self.numeric?(string)
    string.match?(/^\d+$/)
  end
end
