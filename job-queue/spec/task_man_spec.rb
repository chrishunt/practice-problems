require 'task_man'

describe TaskMan do
  subject { TaskMan.new }

  it 'performs single tasks' do
    called = false
    subject.queue { called = true }
    subject.work
    called.should == true
  end

  it 'delays the requested amount of time before performing a task' do
    delay = 0.1
    start_time, end_time = Time.now
    subject.queue(delay) { end_time = Time.now }
    subject.work

    (end_time - start_time).should >= delay
  end

  it 'performs multiple tasks' do
    called_first, called_second = false
    subject.queue { called_first  = true }
    subject.queue { called_second = true }
    subject.work

    called_first.should  == true
    called_second.should == true
  end

  it 'performs tasks in the correct order' do
    first, second, third = Time.now
    subject.queue(0.3) { first  = Time.now }
    subject.queue(0.1) { second = Time.now }
    subject.queue(0.2) { third  = Time.now }
    subject.work

    [first, second, third].sort.should == [second, third, first]
  end

  it 'raises an exception for negative delays' do
    subject.queue(-1).should raise_error
  end
end
