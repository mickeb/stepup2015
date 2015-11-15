
class Animal
  @@sound = "Oidentifierbart"

  def self.sound
    @@sound
  end
end

class Dog < Animal
  @@sound = "VOFF!"
end

puts Dog.sound
puts Animal.sound
