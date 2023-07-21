# In this regex pattern, 
# \b is a word boundary, ensuring that the match is a whole word and not part of a larger word.
# The i flag makes the regex case-insensitive.

class Categorizer
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def call
    case
    when description.match?(%r{NETFLIX|ZEE5|BOOKMYSHOW|AMAZON PRIME})                            # when string has contents like netflix, zee5
      "ENTERTAINMENT"
    when description.match?(%r{IRCTC|MAKE MY TRIP|UBER|OLA})                    # when string has contents like irctc, make my trip
      "TRAVEL"
    when description.match?(%r{GROCERIES|GROCERY|KIRANA|JANA|SOHAN LAL}) # when string has contents like groceries in any case
      "GROCERIES"
    when description.match?(%r{PETROL|OIL|PETROLEUM|INDIANOIL}i)                              # when string has contents like me in any case
      "PETROL"
    when description.match?(/\b(Go\sRails|DRIFTINGRUBY)\b/i)                          # when string has contents like gorails (in anycase) and driftingruby (in uppercase)
      "EDUCATION"
    when description.match?(%r{FRUITS|CHICKEN|MILK|SWIGGY|ZOMATO|CAFE|TEA})                              # when string has contents like me in any case
      "FOOD"
    when description.match?(%r{BIKE|TRIUMPH})
      "BIKE"
    when description.match?(%r{SALARY|DIGITALOCEAN})
      "PROJECT"
    when description.match?(%r{MEDICINES|MEDS|WELLNESS|HEALTH|PHARMACY|MEDICAL|HOSPITAL|TESTS})
      "MEDICINES"
    when description.match?(%r{CLOTHES|CLOTHING|FASHION|SHOPPING|ZARA})
      "SHOPPING"
    else
     'OTHERS'
    end
  end
end
