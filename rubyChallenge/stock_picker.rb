#Wrte a method that takes an array of stock prices, and returns the best profit
# You need to buy before you sell
# Example stock_picker([17,3,6,9,15,8,6,1,10]) => [1,4]  # for a profit of $15 - $3 == $12

def stock_picker stocks
  possible_buy_dates = stocks[0..-2] #cant buy on last day.
  possible_sell_dates = stocks[1..-1] #have to buy before you sell
  best_buy_date, best_sell_date, profit = 0

  possible_buy_dates.each_with_index do |buy_stock, buy_day|
    possible_sell_dates.each_with_index do |sell_stock, sell_day|
      if (sell_stock - buy_stock) > profit
        best_sell_date = sell_day - (buy_day+1)
        best_buy_date = buy_day
        profit = sell_stock - buy_stock
      end
    end
  end
end

stock_picker([17,3,6,9,15,8,6,1,10])
