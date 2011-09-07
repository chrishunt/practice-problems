require 'spec_helper'

describe SecretSanta do
  before(:each) do
    @people = ['doug', 'sallie', 'thom']
    @secret_santa = SecretSanta.new(@people)
  end

  it 'initializes people when created' do
    @secret_santa.people.should == @people
  end

  it 'generates secret santa hash' do
    @secret_santa.santas.should == nil
    @secret_santa.assign_santas
    @secret_santa.santas.should_not == nil
  end

  it 'includes all people in santa hash' do
    santas = @secret_santa.assign_santas
    santas.keys.size.should == @people.size
    santas.values.size.should == @people.size
    @people.each do |p|
      santas.keys.include?(p).should == true
      santas.values.include?(p).should == true
    end
  end
end
