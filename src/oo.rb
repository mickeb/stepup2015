
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

# class Animal
#   def sound # #sound
#     "grymt!"
#   end
# end
#
# class Dog < Animal
#   attr_reader :owner # Ger tillgång till @owner utifrån
#
#   def initialize(owner)
#     @owner = owner # instansvariabler prefixas med "@"
#   end
#
#   def sound
#     "VOFF!"
#   end
# end
#
# class Tax < Dog
#   attr_reader :name
#
#   def initialize(owner, name)
#     super(owner) # #super för anropa basklassens metod
#
#     @name = name
#   end
#
#   def sound
#     "#{super.downcase}..gläffs!"
#   end
# end

# foo = "foo"
#
# if false
#   foo = "foo2"
#   bar = "bar"
# end
#
# puts foo.inspect
# puts bar.inspect

# foo = "foo"
#
# def baz
#   foo = "foo2"
#   puts foo
#   bar = "bar"
# end
#
# baz()
#
# puts foo
# puts bar


# foo = "foo"
#
# def baz
#   puts foo
#   foo = "foo2"
#   puts foo # => "foo2"
#   bar = "bar"
# end
#
# baz()
#
# puts foo # => "foo"
#bar # => undefined local variable or method `bar' for main:Object .....

foo = "foo"

if false
  foo = "foo2"
  bar = "bar"
end

puts foo
puts bar
