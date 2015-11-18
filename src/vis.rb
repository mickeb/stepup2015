
class Animal
  protected
  def eaten_by_other_animal(animal)
    puts "I (#{self}) was eaten by #{animal}"
  end
end

class Lion < Animal
  def eat(animal)
    animal.eaten_by_other_animal(self)
  end
end

class Human
  def eat(animal)
    animal.eaten_by_other_animal(self)
  end
end

class Zebra < Animal
end

lion = Lion.new
zebra = Zebra.new
human = Human.new

lion.eat(zebra)
human.eat(zebra)

#   def sound
#     mjau
#   end
#
#   private
#
#   def mjau
#     "mjau"
#   end
#
#   protected
#
#   def voff
#     "voff"
#   end
# end
#
# class Dog < Animal
#
#   def sound
#     Animal.new.voff
#   end
# end
#
# puts Animal.new.sound
# puts Dog.new.sound
