#Wrte a method that takes an array of stock prices, and returns the best profit
# You need to buy before you sell
# Example stock_picker([17,3,6,9,15,8,6,1,10]) => [1,4]  # for a profit of $15 - $3 == $12

#brute force solution
def stock_picker stocks
  buy_date, sell_date, max_profit = 0, 0, 0

  stocks[0...-1].each_with_index do |buy, day|
    stocks[(day+1)..-1].each do |sell|
      
      if sell - buy > max_profit
        max_profit = sell - buy
        buy_date = stocks.index(buy)
        sell_date = stocks.index(sell)
      end
      
    end
  end
  [buy_date, sell_date]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
