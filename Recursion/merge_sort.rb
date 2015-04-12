# Create recurvise merge_sort

def merge_sort array
  return array if array.size == 1
  mid = array.size / 2
  left = merge_sort array[0...mid]
  right = merge_sort array[mid...array.size]
  merge left, right
end

def merge left, right
  return right if left.empty?
  return left if right.empty?

  if left[0] < right[0]
    [left[0]].concat(merge(left[1...left.size], right))
  else
    [right[0]].concat(merge(left, right[1...right.size]))
  end
end

arr = [5,10,3,1]
p merge_sort arr
