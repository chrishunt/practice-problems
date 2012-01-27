class StringUtils
  def self.reorder(text, pref)
    priority = {}
    sorted   = []
    extra    = []

    pref.split('').each_with_index { |c, i| priority[c] = i }

    text.split('').each do |c|
      if index = priority[c]
        chars = sorted[index]
        sorted[index] = chars ? chars << c : [c]
      else
        extra << c
      end
    end

    sorted.join + extra.join
  end
end
