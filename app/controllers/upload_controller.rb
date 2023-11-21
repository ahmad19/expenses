class UploadController < ApplicationController
  def new; end

  def create
    file_data = File.read(params[:file].tempfile)
    transactions_array = file_data.split(/\r\n/)[2..-1]
    @result = transactions_array.inject([]) do |final, transaction|
      transaction_data = transaction.split(",")
      if transaction_data[4].strip.to_f == 0.0
        final << {
          date: Date.strptime(transaction_data[0].strip, "%d/%m/%y").to_s,
          type: transaction_data[1].strip,
          amount: transaction_data[3].strip.to_f,
          category: Categorizer.new(transaction_data[1].strip).call
        }
      end
      final
    end
    return if @result.empty?

    @transaction = Transaction.new
    @transaction.data = @result
    @transaction.month = params[:month]
    @transaction.year = params[:year]
    @transaction.save!
    @general_result = @result.group_by { |t| t[:category] }.map { |k, v| [k, v.sum { |t| t[:amount] }] }.to_h
    @result = @result.group_by { |t| t[:category] }
    redirect_to root_path
  end
end
