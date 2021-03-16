def stock_picker(prices)
  profit = 0
  best_days = []
  prices.each_with_index do |price, buy|
    for sell in buy..prices.length-1 do
      difference = prices[sell] - price
      if difference > profit
        profit = difference
        best_days = [buy,sell]
      end
    end
  end
  puts "Buy on day #{best_days[0]+1} and sell on day #{best_days[1]+1} for a profit of $#{profit}"
  puts "If only the stock market were this easy"
end

stock_picker([17,3,6,9,15,8,6,1,10])