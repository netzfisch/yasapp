require 'open-uri'
require 'csv'

class Stock
  attr_reader :row0, :row1, :row2, :row3, :row4, :row5, :row6, :row7

  def initialize(symbol)
    @symbol = symbol.upcase
    get_info
  end

  private
  def get_info #Get info about specific stock
    url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@symbol}&f=sl1d1t1c1ohgv&e=.csv"
    csv = CSV.parse(open(url).read)
    csv.each do |row| #parse csv data
      @row0 = row[0]
      @row1 = row[1]
      @row2 = row[2]
      @row3 = row[3]
      @row4 = row[4]
      @row5 = row[5]
      @row6 = row[6]
      @row7 = row[7]
    end
  end
end
