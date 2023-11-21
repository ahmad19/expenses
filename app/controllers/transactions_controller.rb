class TransactionsController < ApplicationController
  before_action :set_transaction

  def show
    grouped_by_category
  end
  
  def statements
    grouped_by_category
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def grouped_by_category
    @transaction_data = Rails.cache.fetch("/transactions/#{@transaction.id}/#{@transaction.updated_at}") do
      @transaction.data.group_by { |t| t["category"] }.sort_by { |k, v| v.sum { |a| a["amount"] } }.reverse
    end
  end
end
