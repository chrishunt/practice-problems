class LRUCache
  attr_reader :size

  def initialize(size)
    @history = []
    @cache   = {}
    @size    = size
  end

  def set(key, value)
    update_history key
    cache[key] = value
  end

  def get(key)
    if result = cache[key]
      update_history key
      result
    end
  end

  private

  def update_history(key)
    history.unshift(key).uniq!
    cache[history.pop] = nil if history.size > size
  end

  def history
    @history
  end

  def cache
    @cache
  end
end
