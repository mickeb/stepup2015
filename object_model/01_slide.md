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

    animal = Dog.new("Micke", "Max")

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

    animal = Dog.new("Micke", "Max")

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
    @@@ ruby
    class Animal
      def self.well_known_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Dog < Animal
    end

    Dog.well_known_sounds

!SLIDE
    @@@ ruby
    class Animal
      def self.well_known_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Dog < Animal
    end

    Dog.well_known_sounds
    # => ["VOFF", "Mjau", "Grymt", "Bää"]
