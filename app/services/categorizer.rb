# In this regex pattern, 
# \b is a word boundary, ensuring that the match is a whole word and not part of a larger word.
# The i flag makes the regex case-insensitive.

class Categorizer
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def call
    criteria = description.split('-').last.strip.downcase
    case
    when criteria.match?(%r{RESTAURANT|TEA})
      Categories::EATING_OUT
    when criteria.match?(%r{GROCERIES|GROCERY})
      Categories::GROCERIES
    when criteria.match?(%r{SHOPPING})
      Categories::SHOPPING
    when criteria.match?(%r{BIKE|TRIUMPH})
      Categories::BIKE
    when criteria.match?(%r{PETROL})
      Categories::PETROL
    when criteria.match?(%r{MEDICINES})
      Categories::MEDICINES
    when criteria.match?(%r{MAINTENANCE})
      Categories::MAINTENANCE
    else
      analyze(description)
    end
  end

  private

  def analyze(description)
    case
    when description.match?(%r{AQUILKHAN1411})
      Categories::HEALTH
    when description.match?(%r{ELECTRICITY|RECHARGE|INTERNET|WASHING})
      Categories::BILLS
    when description.match?(%r{NETFLIX|ZEE5|BOOKMYSHOW|AMAZON PRIME})                            # when string has contents like netflix, zee5
      Categories::ENTERTAINMENT
    when description.match?(%r{IRCTC|MAKEMYTRIP|UBER|OLA|RICKSHAW|HOTEL})                    # when string has contents like irctc, make my trip
      Categories::TRAVEL
    when description.match?(%r{GROCERIES|GROCERY|KIRANA|JANA|SOHAN LAL|FOOD|FRUITS|CHICKEN|MILK|BLINKIT}) # when string has contents like groceries in any case
      Categories::GROCERIES
    when description.match?(%r{PETROL|OIL|PETROLEUM|INDIANOIL}i)                              # when string has contents like me in any case
      Categories::PETROL
    when description.match?(/\b(Go\sRails|DRIFTINGRUBY|MIDJOURNEY)\b/i)                          # when string has contents like gorails (in anycase) and driftingruby (in uppercase)
      Categories::EDUCATION
    when description.match?(%r{SWIGGY|ZOMATO|CAFE|TEA|RESTAURANT|JUICE})                              # when string has contents like me in any case
      Categories::EATING_OUT
    when description.match?(%r{BIKE|TRIUMPH})
      Categories::BIKE
    when description.match?(%r{SALARY|DIGITALOCEAN|SANTOSHSKUMBHAR08})
      Categories::PROJECT
    when description.match?(%r{MEDICINES|MEDS|WELLNESS|HEALTH|PHARMACY|MEDICAL|HOSPITAL|TESTS})
      Categories::MEDICINES
    when description.match?(%r{CLOTHES|CLOTHING|FASHION|SHOPPING|ZARA})
      Categories::SHOPPING
    when description.match?(%r{DONATION})
      Categories::DONATION
    when description.match?(%r{LICOFINDIA})
      Categories::INSURANCE
    else
      Categories::OTHERS
    end
  end
end
