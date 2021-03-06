require_relative 'restricted_array.rb'
require 'pry'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  i = 0
  until array[i] == nil
    if array[i] != nil
      i += 1
    end
  end
  return i
end

# time: O(n) - goes through the loop n times, the length of the array
# space: O(1) - storage stays the same the length or size of the array

# Prints each integer values in the array
def print_array(array)
  i = 0
  while i < array.length - 1
    print "#{array[i]} "
    i += 1
  end
  print "#{array[i]}"
end

# time: O(n) - goes through the loop n times, the length of the array - 1
# space: O(1) - storage stays the same the length or size of the array

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  i = 0
  while i < length
    if value_to_find == array[i]
      return true
    else
      i += 1
    end
  end
  return false
end

# time: O(n) - goes through the loop n times, until it reaches the value found
# space: O(1) - the array is unchanged

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  largest = array[0]
  i = 1
  while i < length
    if array[i] > largest
      largest = array[i]
    end
    i += 1
  end
  return largest
end

# time: O(n) - goes through the loop n times, until it reaches the value found
# space: O(1) - the array is unchanged

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  smallest = array[0]
  i = 1
  while i < length
    if array[i] < smallest
      smallest = array[i]
    end
    i += 1
  end
  return smallest
end

# time: O(n) - goes through the loop n times, until it reaches the value found
# space: O(1) - the array is unchanged

# Reverses the values in the integer array in place
def reverse(array, length)
  front_index = 0
  back_index = length - 1

  while front_index < back_index
    front_value = array[front_index]
    back_value = array[back_index]

    array[front_index] = back_value
    array[back_index] = front_value

    front_index += 1
    back_index -= 1
  end
end

# time: O(n) - goes through the loop n times, the array length
# space: O(1) - the array size is same each time it goes through the while loop

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  return false if length == 0

  low = 0
  high = length - 1

  while low < high
    mid = (high + low)/2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    elsif array[mid] < value_to_find
      low = mid + 1
    end
  end
  return array[low] == value_to_find ? true : false
end

# time: best case: O(1) - if the first one, or log(n)
# space: O(1) - the space taken is the same for any number of elements in the array

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
