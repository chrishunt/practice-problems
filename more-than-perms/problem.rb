# Given a set of letters and a length N, produce all possible output. (Not permutation).
# For example, give the letter (p,o) and length of 3, produce the following
# output(in any order you want, not just my example order):
#
# ppp ppo poo pop opp opo oop ooo
#
# another example would be given (a,b) and length 2:
#
# ab aa bb ba

def print_perms(letters, length, current_perm="")
  if current_perm.size == length
    puts current_perm
  else
    letters.each do |letter|
      print_perms(letters, length, current_perm + letter)
    end
  end
end

print_perms(["p", "o"], 3)
