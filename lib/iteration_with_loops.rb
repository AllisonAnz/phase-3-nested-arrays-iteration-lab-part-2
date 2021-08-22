# Extract Some information from a nested data structure 
# Using an AoA and two while loops to handle the iteration 
# This time you will need to collect specific values and return them in a new array 

# Traverse Array of Arrays to Produce a New Data Structure 
# The same formula used in the last lab can be adapted for doing work other than puting things 
# Say we wanted to gether all the elements that start with the letter P into a new array 
spice_rack = [
  ["Posh", "Scary", "Sporty"],
  ["Paprika", "Fajita Mix", "Coriander"],
  ["Parsley", "Sage", "Rosemary"]
]

outer_results = []
row_index = 0
while row_index < spice_rack.count do
  element_index = 0
  while element_index < spice_rack[row_index].count do
    # How to read the following line of code:
    #   Array at row_index
    #   Element of the inner array at element_index
    #   The first character of that element...
    if spice_rack[row_index][element_index][0] == "P"
      outer_results << spice_rack[row_index][element_index]
    end
    element_index += 1
  end
  row_index += 1
end

outer_results #=>  ["Posh", "Paprika", "Parsley"] 

# We might say we are filtering the value in this data struture 
# A slight variation of this code will aloow us to compare values 
# Handy for when we need to do things like find a max or minimum value 

# Say we want to collect the longest string in each nested array from our previous example 
# Instead of using a conditional to check for "P"
# We could use a variable to keep tract of the longest string 
spice_rack = [
  ["Posh", "Scary", "Sporty"],
  ["Paprika", "Fajita Mix", "Coriander"],
  ["Parsley", "Sage", "Rosemary"]
]

outer_results = []
row_index = 0
while row_index < spice_rack.count do
  element_index = 0
  longest_string_element = ""
  while element_index < spice_rack[row_index].count do

    # Array at row_index
    # Element of the inner array at element_index
    # If the length of the current element is greater than the length of longest_string_element
    # Set longest_string_element to the current element
    if spice_rack[row_index][element_index].length > longest_string_element.length
      longest_string_element = spice_rack[row_index][element_index]
    end
    element_index += 1
  end

  # We have to check every element in each inner array, so after the loop finishes
  # The current value of longest_string_element is pushed into outer_results
  outer_results << longest_string_element
  row_index += 1
end

outer_results # => ["Sporty", "Fajita Mix", "Rosemary"] 

#------------------------------------------------------------------------------------------
array_of_daily_temperatures = [
  [19, 21, 24, 26, 30, 34, 37, 39, 40, 45, 48, 50, 55, 60, 63, 59, 49, 45, 40, 39, 34, 32, 25, 18],
  [17, 18, 22, 26, 31, 35, 38, 40, 43, 45, 49, 52, 55, 61, 60, 59, 55, 49, 45, 38, 32, 30, 24, 19],
  [13, 15, 20, 23, 33, 37, 39, 41, 45, 48, 50, 53, 57, 62, 61, 58, 52, 48, 44, 36, 35, 31, 23, 20],
  [19, 20, 25, 28, 30, 35, 38, 40, 41, 46, 48, 51, 56, 60, 59, 55, 50, 45, 43, 39, 36, 34, 25, 24],
  [21, 25, 28, 30, 35, 41, 47, 49, 50, 55, 56, 57, 58, 64, 63, 58, 49, 44, 42, 36, 33, 33, 27, 20],
  [25, 29, 30, 36, 39, 45, 49, 50, 52, 57, 58, 59, 60, 66, 65, 59, 54, 49, 45, 40, 36, 30, 26, 24],
  [30, 36, 38, 39, 40, 45, 47, 49, 50, 59, 60, 60, 65, 63, 61, 56, 49, 43, 40, 39, 35, 32, 23, 22],
] 

# We need to pass our method 
# find_min_in_nested_arrays(array_of_daily_temperatures) 
# => [18, 17, 13, 19, 20, 24, 22] 

def find_min_in_nested_arrays(src)
  # src will be an array of arrays of integers
  # Produce a new Array that contains the smallest number of each of the nested arrays
  outer_results = []
  row_index = 0 
  while row_index < src.count do 
    element_index = 0 
    inner_results = []
    lowest_value = 100 
    while element_index < src[row_index].count do 
      if src[row_index][element_index] < lowest_value
        lowest_value = src[row_index][element_index]
      end
      element_index += 1 
    end 
    outer_results << lowest_value 
    row_index += 1 
  end 
  outer_results
end

 p find_min_in_nested_arrays(array_of_daily_temperatures)
 #=> [18, 17, 13, 19, 20, 24, 22]