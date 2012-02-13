class TaskMan
  def initialize
    @tasks = {}
  end

  def queue(delay = 0, &task)
    @tasks[delay] ||= []
    @tasks[delay] << task
  end

  def work
    start_time = Time.now
    @tasks.keys.sort.each do |delay|
      sleep (Time.now - start_time) + delay
      @tasks[delay].each { |t| t.call }
    end
  end
end
