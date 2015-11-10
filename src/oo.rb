
# class Animal
#   def self.well_known_sounds
#      ["VOFF", "Mjau", "Grymt", "Bää"]
#   end
#
#   def foo
#     puts "testtest"
#   end
# end
#
# class Dog < Animal
#
# end
#
# dog = Dog.new
#
# puts dog.class
#
# puts Dog.well_known_sounds

class Animal
  def sound # #sound
    "grymt!"
  end
end

class Dog < Animal
  attr_reader :owner # Ger tillgång till @owner utifrån

  def initialize(owner)
    @owner = owner # instansvariabler prefixas med "@"
  end

  def sound
    "VOFF!"
  end
end

class Tax < Dog
  attr_reader :name

  def initialize(owner, name)
    super(owner) # #super för anropa basklassens metod

    @name = name
  end

  def sound
    "#{super.downcase}..gläffs!"
  end
end
