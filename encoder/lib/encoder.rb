class Encoder
  SEPARATOR  = ','
  ESCAPE     = '@1'
  AT_ESCAPE  = '@2'
  NIL_ESCAPE = '@3'

  def encode(strings)
    strings.inject('') do |result, string|
      if string.nil?
        string = NIL_ESCAPE
      else
        string = string.gsub('@', AT_ESCAPE).gsub(SEPARATOR, ESCAPE)
      end
      result += string + SEPARATOR
    end[0..-2]
  end

  def decode(string)
    string.split(SEPARATOR).map do |string|
      if string == NIL_ESCAPE
        string = nil
      else
        string = string.gsub(ESCAPE, SEPARATOR).gsub(AT_ESCAPE, '@')
      end

      string
    end
  end
end
