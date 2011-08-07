# Given a number, come up with all of the possible ways to insert '+' and '-'
# in that number. For example given 123, possible answer would be:
#
# 1+23
# 1+2+3
# 1-23
# 1-2+3
# 1-2-3
# 1+2-3
# 12+3
# 12-3

def print_perms(string, chars, position=0, current_perm="")
  string_array = string.split("")

  # If we have an empty string, then print no permutations
  if (string_array.size < 1)
    puts ""
    return
  end

  # If we're done with this perm, print it
  if (position == (string_array.size - 1))
    puts current_perm + string_array.last
    return
  end

  # Print all permutations
  chars.each do |char|
    next_perm = current_perm + string_array[position] + char
    print_perms(string, chars, position+1, next_perm)
  end
end

# Special case of print_perms for this example
def print_sums(string)
  print_perms(string, ["","-","+"])
end

print_sums("123")
