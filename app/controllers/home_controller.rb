class HomeController < ApplicationController
  def index
    @transactions_grouped_with_total_amount = Rails.cache.fetch("transactions_grouped_with_total_amount")
    @transactions_grouped = Rails.cache.fetch("transactions_grouped")
  end
end
