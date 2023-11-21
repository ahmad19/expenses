class HomeController < ApplicationController
  def index
    # grouped_by_category = Transaction.all.group_by(&:month).each_with_object({}) do |(month, transactions), hash|
    #   hash[month] = transactions.flat_map(&:data).group_by { |t| t["category"] }
    # end
    
    # @total_expenses_per_category_month = grouped_by_category.transform_values { |data| data.transform_values { |d| d.sum {|s| s['amount']}} }
    aggregated_data = {}
    transactions = Transaction.all
    transactions.each do |transaction|
      json_data = transaction.data

      json_data.each do |entry|
        next if entry['category'] == 'OTHERS'

        category = entry['category']
        amount = entry['amount'].present? && entry['amount'] || 0.0
        period = "#{transaction.month}"
        aggregated_data[category] ||= {}
        aggregated_data[category][period] = aggregated_data[category].fetch(period, 0) + amount.to_f
      end
    end

    @chartkick_data = aggregated_data.map do |category, periods|
      { name: category, data: periods }
    end
    # @chartkick_data = {}
    # aggregated_data.each do |category, month_values|
    #   month_values.each do |month, amount|
    #     @chartkick_data[month] ||= {}
    #     @chartkick_data[month][category] = amount
    #   end
    # end
    @chartkick_data
  end

  private

  def grouped_by_category
   
  end
end
