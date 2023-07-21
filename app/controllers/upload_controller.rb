class UploadController < ApplicationController
  def index; end

  def create
    file_data = File.read(params[:file].tempfile)
    transactions_array = file_data.split(/\r\n/)[2..-1]
    result = transactions_array.inject([]) do |final, transaction|
      transaction_data = transaction.split(",")
      if transaction_data[4].strip.to_f == 0.0
        final << {
          date: Date.strptime(transaction_data[0].strip, "%m/%d/%y"),
          type: transaction_data[1].strip,
          amount: transaction_data[3].strip.to_f,
          category: Categorizer.new(transaction_data[1].strip).call
        }
      end
      final
    end
    redirect_to root_path, notice: "File uploaded successfully and procssed!"
  end
end
