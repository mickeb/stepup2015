
class Animal
  def self.common_sounds
    ["VOFF", "Mjau", "Grymt", "Bää"]
  end
end

animal1 = Animal.new
animal2 = Animal.new

def animal1.sound
  "Mjau"
end

puts animal1.singleton_class
puts animal1.singleton_class.instance_methods(false).inspect

puts animal2.singleton_class
puts animal2.singleton_class.instance_methods(false).inspect

puts Animal.singleton_class
puts Animal.singleton_class.instance_methods.inspect
