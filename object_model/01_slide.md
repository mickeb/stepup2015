!SLIDE small
# Rubys objektsmodell
## Förädisk enkel

!SLIDE small
# Låt oss börja från grunden
## (men gå fort fram)

!SLIDE small
# Klassdefinition
    @@@ ruby
    class Animal
    end

!SLIDE small
# Instansiering
    @@@ ruby
    class Animal
    end

    # Via "klassmetoden" .new
    animal = Animal.new

!SLIDE small
# Instansiering
    @@@ ruby
    class Animal
    end

    # Via "klassmetoden" .new
    animal = Animal.new # => #<Animal:0x007fd5fc110560>

!SLIDE small
# Instansmetod
    @@@ ruby
    class Animal
      def sound # #sound
        "grymt!"
      end
    end

    animal = Animal.new
    puts animal.sound

!SLIDE small
# Instansmetod
    @@@ ruby
    class Animal
      def sound # #sound
        "grymt!"
      end
    end

    animal = Animal.new # => #<Animal:0x007fd5fc110560>
    puts animal.sound # => "grymt!"

!SLIDE execute small
# Subklass
## (med arv och överskuggning)
    @@@ ruby
    class Dog < Animal # Arv
      def sound # Överskuggning
        "VOFF!"
      end
    end

    dog = Dog.new
    puts dog.sound

!SLIDE execute small
# Subklass
## (med arv och överskuggning)
    @@@ ruby
    class Dog < Animal # Arv
      def sound # Överskuggning
        "VOFF!"
      end
    end

    dog = Dog.new # => #<Dog:0x007fd5fc110560>
    puts dog.sound # => "VOFF!"

!SLIDE small
# Subklass
## (konstruktor och instansvariabel)
    @@@ ruby
    class Dog < Animal
      attr_reader :owner # Ger tillgång till @owner utifrån

      def initialize(owner)
        @owner = owner # instansvariabler prefixas med "@"
      end

      def sound
        "VOFF!"
      end
    end

    animal = Dog.new("Micke")

    puts animal.sound
    puts animal.owner

!SLIDE small
# Subklass
## (konstruktor och instansvariabel)
    @@@ ruby
    class Dog < Animal
      attr_reader :owner # Ger tillgång till @owner utifrån

      def initialize(owner)
        @owner = owner # instansvariabler prefixas med "@"
      end

      def sound
        "VOFF!"
      end
    end

    animal = Dog.new("Micke") # => #<Dog:0x007fd5fc110560>

    puts animal.sound # => "VOFF!"
    puts animal.owner # => "Micke"

!SLIDE small
# Subklass
## (anrop till basklass metod)
    @@@ ruby
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

    animal = Tax.new("Micke", "Max")

    puts animal.sound
    puts animal.owner
    puts animal.name

!SLIDE small
# Subklass
## (anrop till basklass metod)
    @@@ ruby
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

    animal = Tax.new("Micke", "Max")

    puts animal.sound # => "voff!..gläffs!"
    puts animal.owner # => "Micke"
    puts animal.name # => "Max"

!SLIDE
# Förädisk enkel?

!SLIDE
    @@@ ruby
    "VOFF".class # => String

!SLIDE

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal

!SLIDE

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

!SLIDE

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

###
    @@@ ruby
    Tax.class

!SLIDE

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

###
    @@@ ruby
    Tax.class # => Class

!SLIDE
    @@@ ruby
    Animal.class # => Class
    Dog.class # => Class
    Tax.class # => Class

!SLIDE
    @@@ ruby
    Animal.class # => Class
    Dog.class # => Class
    Tax.class # => Class
####
    @@@ ruby
    Class.class

!SLIDE
    @@@ ruby
    Animal.class # => Class
    Dog.class # => Class
    Tax.class # => Class
####
    @@@ ruby
    Class.class # => Class

!SLIDE
## Vilket borde innebära:
    @@@ ruby
    tax_class = Tax
    tax = tax_class.new("Micke", "Max")

!SLIDE
## Vilket borde innebära:
    @@@ ruby
    tax_class = Tax # => Tax
    tax = dog_class.new("Micke", "Max")
    # => #<Tax:0x007f83c3095c38>

!SLIDE small
## Exempel
    @@@ ruby
    class MyClass
      class MyException < StandardError; end
    end

!SLIDE small
## Exempel
    @@@ ruby
    class MyClass
      class MyException < StandardError; end
    end
####
    @@@ ruby
    class MyClass
      MyException = Class.new StandardError
    end

!SLIDE center
## Översikt
![Ruby](http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png)
### http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png

!SLIDE
# Lite förvirrande i alla fall

!SLIDE
# "klassmetod"

!SLIDE
# "klassmetod"
## ==
# instansmetod i instanser av klassen Class

!SLIDE
# klassmetod

!SLIDE
### Exempel 1:
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Dog < Animal
    end

    Dog.common_sounds

!SLIDE
### Exempel 1:
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Dog < Animal
    end

    Dog.common_sounds
    # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE small
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

!SLIDE small
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>

!SLIDE small
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>
    Animal.superclass # => Object

!SLIDE small
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>
    Animal.superclass # => Object
    Object.methods

!SLIDE small
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>
    Animal.superclass # => Object
    Object.methods # => [..., :new, ...]

!SLIDE
## Även "klassmetoder" ärvs

!SLIDE small
## Exempel 2:
    @@@ ruby
    max = Tax.new("Micke", "Max")
    charlie = Tax.new("Micke", "Charlie")

    def max.color
      "brown"
    end

    puts max.color
    puts charlie.color

!SLIDE small
## Exempel 2:
    @@@ ruby
    max = Tax.new("Micke", "Max")
    charlie = Tax.new("Micke", "Charlie")

    def max.color
      "brown"
    end

    puts max.color # => "brown"
    puts charlie.color
    # => undefined method `color' for #<Dog:0x007fbaba12daf0>

!SLIDE small
## Exempel 2.1:
    @@@ ruby
    def Tax.color
      "brown"
    end

    puts Tax.color

!SLIDE small
## Exempel 2.1:
    @@@ ruby
    class Tax < Dog
      # ...
    end

    def Tax.color
      "brown"
    end

    puts Tax.color # => "brown"

!SLIDE small
## Exempel 2.1:
    @@@ ruby
    class Tax < Dog
      # ...
    end

    def Tax.color
      "brown"
    end

    ==

    class Tax
      def self.color
        "brown"
      end
    end

    puts Tax.color # => "brown"

!SLIDE
# Singletonklass
##(aka Metaclass, Shadowclass, Eigenclass)

!SLIDE

### Alla objekt i ruby har en singletonklass associerad till sig

!SLIDE

### Alla objekt i ruby har en singletonklass associerad till sig
### som inte existerar

!SLIDE

### Alla objekt i ruby har en singletonklass associerad till sig
### som inte existerar
### förrän den refereras

!SLIDE small
    @@@ ruby

    Tax.instance_methods(false) # => [:name, :sound]

    max = Tax.new("Micke", "Max")
    charlie = Tax.new("Micke", "Charlie")

    max_singleton = max.singleton_class
    # => #<Class:#<Tax:0x007fe751096358>>
    charlie_singleton = charlie.singleton_class
    # => #<Class:#<Tax:0x007fe7510777c8>>

    def max.color
      "brown"
    end

    puts max.color # => "brown"
    puts charlie.color
    # => undefined method `color' for #<Dog:0x007fbaba12daf0>
