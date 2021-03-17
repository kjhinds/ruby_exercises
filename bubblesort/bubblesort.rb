def bubblesort(array)
  begin
    swapped = false
    times_looped = 0
    for i in (0...array.length-times_looped-1) do
      if array[i] > array[i+1]
        temp = array[i]
        array[i] = array[i+1] 
        array[i+1] = temp
        swapped = true
        times_looped += 1
      end
    end
  end while swapped
  array
end


unsorted_array = [23,1,3,2,5,8,43,76,4,3]
p bubblesort(unsorted_array)