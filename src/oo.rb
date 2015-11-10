
class Animal
  def self.well_known_sounds
     ["VOFF", "Mjau", "Grymt", "Bää"]
  end
end

class Dog < Animal

end

dog = Dog.new

puts dog.class

puts Dog.well_known_sounds
