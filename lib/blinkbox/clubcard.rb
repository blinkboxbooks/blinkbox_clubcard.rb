# Container module. See Blinkbox::Clubcard
module Blinkbox
  # Represents a Clubcard
  #
  # A Blinkbox::Clubcard object contains a pair of fields:
  #
  #  * The 'number' is the Clubcard's number
  #  * The 'type' represents the type of Clubcard this is. Currently this library supports the following types:
  #    - Blinkbox::Clubcard::UK - A standard UK Clubcard
  class Clubcard
    # The beginning number space for this type of Clubcard. Required.
    BIN_BEGIN = nil

    # The end number space for this type of Clubcard. Optional.
    BIN_END   = nil

    # How many digits there are in this type of Clubcard. Required.
    LENGTH    = 18

    attr_accessor :number

    def initialize(number, validate: true)
      if validate
        fail "Invalid Clubcard number for #{self.class}: (#{number})" unless self.class.validate(number)
      end
      self.number = number.to_s
    end

    # Represents the type of Clubcard this is.
    def type
      self.class
    end

    # Generates a random Clubcard number of the specified type.
    def self.generate_random_number(type: self)
      # Default to generating a UK Clubcard if called from Blinkbox::Clubcard without an explicit
      # declaration of the type of Clubcard desired.
      type = Blinkbox::Clubcard::UK if type == Blinkbox::Clubcard

      # If a BIN_END has been declared for that type of Clubcard, pick a random prefix from within a
      # range.
      #
      # If no BIN_END has been declared for that type of Clubcard, simply use the BIN_BEGIN
      prefix = type::BIN_END ? Random.rand((type::BIN_BEGIN)...(type::BIN_END)).to_s : type::BIN_BEGIN.to_s

      # The unique part of the Clubcard number to be used within the prefix's number space, left padded
      # with 0s where necessary to meet the Clubcard type's specified LENGTH
      uniq   = Random.rand(1...(type.uniq_upper)).to_s.rjust((type::LENGTH - prefix.length), '0')

      cc_num = prefix + uniq

      # The last digit now needs to be removed, and from what's remaining; generate the check digit
      # and append this
      check_digit = Blinkbox::Clubcard.check_digit(cc_num.chop!)
      "#{cc_num}#{check_digit}"
    end

    # Convenience method to generate a random Clubcard number and instantiate an object of that type.
    def self.create_random_clubcard(type: self)
      type = Blinkbox::Clubcard::UK if type == Blinkbox::Clubcard
      cc_num = Blinkbox::Clubcard.generate_random_number(type: type)

      type.new(cc_num)
    end

    # Returns the check digit for a given number
    def self.check_digit(number)
      weighted = number.chars.map.with_index { |c, i| c.to_i * (i.even? ? 2 : 1) }
      check = 10 - weighted.map { |n| n.digits.sum }.sum.digits.last
      check == 10 ? 0 : check
    end

    # Checks if the provided number is valid for that given type of Clubcard
    def self.validate(number)
      lower_bound =  self.uniq_upper * self::BIN_BEGIN
      if self::BIN_END.nil?
        upper_bound = lower_bound + (self.uniq_upper - 1)
      else
        upper_bound =  self.uniq_upper * self::BIN_END
      end

      if number.to_s.length == self::LENGTH &&
      (lower_bound <= number.to_i && upper_bound >= number.to_i) &&
      (number[-1] == Blinkbox::Clubcard.check_digit(number.chop).to_s)
        return true
      else
        return false
      end
    end

    # Calculates the upper end digit a possible unique number could be within a given Clubcard type's
    # number space.
    def self.uniq_upper
      10**(self::LENGTH - self::BIN_BEGIN.to_s.length)
    end
  end
end

require_relative 'clubcard/types'

# Various core extensions

class Fixnum
  def digits
    self.to_s.chars.map(&:to_i)
  end
end

class Array
  def sum
    self.inject(:+)
  end
end
