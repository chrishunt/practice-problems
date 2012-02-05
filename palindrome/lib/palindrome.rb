class String
  # Let's not cheat here :)
  # self.gsub(' ', '') == self.reverse.gsub(' ', '')
  def palindrome?
    punc = [',', '.', '!', '?', '/', '\\', ' ']
    i = 0
    j = self.size - 1

    while i < j
      while punc.include?(self[i]) && i < j do i += 1 end
      while punc.include?(self[j]) && j > i do j -= 1 end
      return false if self[i].downcase != self[j].downcase
      i += 1
      j -= 1
    end

    true
  end
end
