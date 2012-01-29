class StringUtils
  def self.min_match(text, chars)
    return unless text && chars

    text_a = text.split('')
    char_a = chars.split('')

    # find all possible starting points for a match
    starts = text_a.each_with_index.map { |c, i| i if c == char_a.first }.compact

    # find length of shortest match
    min_index, min_length = nil
    starts.each do |start|
      i = start
      j = 0
      while j < char_a.size
        if (j == char_a.size - 1)   &&
           (text_a[i] == char_a[j]) &&
           (!min_length || i - start < min_length)

          min_index  = start
          min_length = i - start
        end
        j += 1 if text_a[i] == char_a[j]
        i += 1
      end
    end

    # return shortest match if match was found
    text_a[min_index..min_length + min_index].join if min_length && min_index
  end
end
