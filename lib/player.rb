class Player

  @@sides =['x','o']

  attr_reader :name, :side

  def self.reset
    @@sides = ['x','o']
  end

  def initialize(name)
    @name = name
    @side = @@sides[0]
    @@sides.delete_at(0)
  end
end







