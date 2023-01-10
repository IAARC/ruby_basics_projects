def bubble_sort(array)
    for i in 0...array.length - 1
        array.each_index do |index|
            if array[index] != array[array.length - 1]
                if array[index] > array[index + 1] 
                    array[index + 1], array[index] = array[index], array[index + 1]
                end
            end
        end
    end
   p array
end
bubble_sort([100,90,80,50,30,20,15,14,13,12,12,40,1,10,9,8,4,6,3,1,0,32,1239])