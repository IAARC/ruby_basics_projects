def stock_picker(array)
    combination = array.combination(2).to_a
    list_of_results = combination.map{|value| value[1] - value[0]}
    index_of_result = list_of_results.each_with_index.max[1]
    best_days = Array.new
    array.each_with_index do |value, index|
        if value == combination[index_of_result][0] || value == combination[index_of_result][1]
            best_days.push(index)
        end
    end
    puts "the best day to buy is #{best_days[0]} and the best day to sell is #{best_days[1]} for a profit of $#{array[best_days[1]]} - #{array[best_days[0]]} = #{list_of_results.max}"
    best_days
end
stock_picker([17,3,6,9,15,8,6,1,10])