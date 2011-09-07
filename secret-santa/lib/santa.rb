class SecretSanta
  attr_accessor :people, :santas

  def initialize(people)
    @people = people
  end

  def assign_santas
    # initialize santa hash
    @santas = {}
    # shuffle our collection of people
    sh = @people.shuffle
    # assign secret santa to each person
    i = 0
    while(i<sh.size) do
      @santas[sh[i]] = (i+1) < sh.size ? sh[i+1] : sh[0]
      i = i + 1
    end
    # return our santa hash
    return @santas
  end
end
