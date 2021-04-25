def merge_sort(array)
  return array if array.length <= 1

  left, right = array.each_slice((array.length / 2.0).round).to_a

  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge(left, right)
  result = []

  until left.empty? || right.empty?
    if left.first <= right.first
      result.push(left.first)
      left.shift
    else
      result.push(right.first)
      right.shift
    end
  end

  result.concat(left) unless left.empty?
  result.concat(right) unless right.empty?

  result
end

unsorted = [1, 3, 4, 2, 6, 5]
sorted = merge_sort(unsorted)
puts sorted
