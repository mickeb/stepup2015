!SLIDE smaller
# Rubys objektsmodell
## Förädisk enkel

!SLIDE smaller
# Låt oss börja från grunden
## (men gå fort fram)

!SLIDE smaller
# Klassdefinition
    @@@ ruby
    class Animal
    end

!SLIDE smaller

# Konstanter

* Börjar alltid med stor bokstav
* Klasser, moduler eller värden
* Kan näslas

!SLIDE smaller

## Börjar alltid med stor bokstav
### MyConstant
### MY_CONSTANT

!SLIDE smaller

## Klasser, moduler eller värden

    @@@ ruby
    class Animal; end
    module House; end
####
    @@@ ruby
    MY_CONSTANT = 1

!SLIDE smaller

## Kan näslas

    @@@ ruby
    class Animal
      NUMBER_OF_SPECIES = 8700000
    end

    Animal::NUMBER_OF_SPECIES # => 8700000

!SLIDE smaller
# Klassdefinition
    @@@ ruby
    class Animal
    end

!SLIDE smaller
# Instansiering
    @@@ ruby
    class Animal
    end

    # Via "klassmetoden" .new
    animal = Animal.new

!SLIDE smaller
# Instansiering
    @@@ ruby
    class Animal
    end

    # Via "klassmetoden" .new
    animal = Animal.new
    animal # => #<Animal:0x007fd5fc110560>

!SLIDE smaller

# Lokala variabler

* Börjar alltid med liten bokstav
* Alltid snake_case
* Scope

!SLIDE smaller

## Börjar alltid med liten bokstav + snake_case
### Bra:

    @@@ ruby
    my_var = 42

### Dåligt:
    @@@ ruby
    myVar = 42

!SLIDE smaller

## Scope

Scope avgränsas nyckelorden class, module, def samt block syntax

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    def baz
      foo = "foo2"
      puts foo
      bar = "bar"
    end

    baz()

    puts foo
    puts bar

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    def baz
      foo = "foo2"
      puts foo # => "foo2"
      bar = "bar"
    end

    baz()

    puts foo # => "foo"
    puts bar # => undefined local variable or method `bar' for main:Object .....

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    puts foo
    puts bar

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    puts foo # => "foo2"
    puts bar # => "bar"

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    puts foo # => "foo2"
    puts bar # => "bar"

####
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
      bar = "bar"
    end

    puts foo # => "foo2"
    puts bar # => nil

!SLIDE smaller
# Instansiering
    @@@ ruby
    class Animal
    end

    # Via "klassmetoden" .new
    animal = Animal.new
    animal # => #<Animal:0x007fd5fc110560>

!SLIDE smaller
# Instansmetod
    @@@ ruby
    class Animal
      def sound
        "grymt!"
      end
    end

    animal = Animal.new
    puts animal.sound

!SLIDE smaller
# Instansmetod
    @@@ ruby
    class Animal
      def sound
        "grymt!"
      end
    end

    animal = Animal.new # => #<Animal:0x007fd5fc110560>
    puts animal.sound # => "grymt!"

!SLIDE execute smaller
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

!SLIDE smaller
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

!SLIDE smaller
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

!SLIDE smaller
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

!SLIDE smaller
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

!SLIDE smaller
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

!SLIDE smaller
# Förädisk enkel?

!SLIDE smaller
    @@@ ruby
    "VOFF".class # => String

!SLIDE smaller
    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal

!SLIDE smaller

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

!SLIDE smaller

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

###
    @@@ ruby
    Tax.class

!SLIDE smaller

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

###
    @@@ ruby
    Tax.class # => Class

!SLIDE smaller
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

!SLIDE smaller
## Exempel
    @@@ ruby
    class MyClass
      class MyException < StandardError; end
    end

!SLIDE smaller
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

!SLIDE smaller center
## Översikt
![Ruby](http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png)
### http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png

!SLIDE smaller
# Lite förvirrande i alla fall

!SLIDE smaller
# "klassmetod"

!SLIDE smaller
# "klassmetod"
## ==
# instansmetod i instanser av klassen Class

!SLIDE smaller
# klassmetod

!SLIDE smaller
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

!SLIDE smaller
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

!SLIDE smaller
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

!SLIDE smaller
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>

!SLIDE smaller
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>
    Animal.superclass # => Object

!SLIDE smaller
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>
    Animal.superclass # => Object
    Object.methods

!SLIDE smaller
## Exempel 1.1:
    @@@ ruby
    class Animal
    end

    animal = Animal.new # => #<Dog:0x007fd5fc110560>
    Animal.superclass # => Object
    Object.methods # => [..., :new, ...]

!SLIDE smaller
## Även "klassmetoder" ärvs

!SLIDE smaller
## Exempel 2:
    @@@ ruby
    max = Tax.new("Micke", "Max")
    charlie = Tax.new("Micke", "Charlie")

    def max.color
      "brown"
    end

    puts max.color
    puts charlie.color

!SLIDE smaller
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

!SLIDE smaller
## Exempel 2.1:
    @@@ ruby
    def Tax.color
      "brown"
    end

    puts Tax.color

!SLIDE smaller
## Exempel 2.1:
    @@@ ruby
    class Tax < Dog
      # ...
    end

    def Tax.color
      "brown"
    end

    puts Tax.color # => "brown"

!SLIDE smaller
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

!SLIDE smaller
# Singletonklass
##(aka Metaclass, Shadowclass, Eigenclass)

!SLIDE smaller

### Alla objekt i ruby har en singletonklass associerad till sig

!SLIDE smaller

### Alla objekt i ruby har en singletonklass associerad till sig
### som inte existerar

!SLIDE smaller

### Alla objekt i ruby har en singletonklass associerad till sig
### som inte existerar
### förrän den refereras

!SLIDE smaller
    @@@ ruby

    Tax.instance_methods(false) # => [:name, :sound]

    max = Tax.new("Micke", "Max")
    charlie = Tax.new("Micke", "Charlie")

    max_singleton = max.singleton_class
    # => #<Class:#<Tax:0x007fe751096358>>
    charlie_singleton = charlie.singleton_class
    # => #<Class:#<Tax:0x007fe7510777c8>>

    max_singleton.instance_methods(false)
    # => []

    charlie_singleton.instance_methods(false)
    # => []

    def max.color
      "brown"
    end

    max_singleton.instance_methods(false)
    # => [:color]

    charlie_singleton.instance_methods(false)
    # => []

    puts max.color # => "brown"
    puts charlie.color
    # => undefined method `color' for #<Dog:0x007fbaba12daf0>

!SLIDE smaller
# Moduler

!SLIDE smaller
## En modul
    @@@ ruby
    module Animals

    end

!SLIDE smaller
## Användningsområden

* Namespacing
* Composition
* Extending

!SLIDE smaller
## Namespacing (klass)

    @@@ ruby
    module Animals
      class Dog
      end
    end

!SLIDE smaller
## Namespacing (klass)

    @@@ ruby
    module Animals
      class Dog
      end
    end

    dog = Animals::Dog.new # => #<Animals::Dog:0x007fb31c0ac950>

!SLIDE smaller
## Namespacing (metod)
    @@@ ruby
    module Animals
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

!SLIDE smaller
## Namespacing (metod)
    @@@ ruby
    module Animals
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animals.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE smaller
## Composition (mixin)
    @@@ ruby
    def common_sounds
      ["VOFF", "Mjau", "Grymt", "Bää"]
    end
####
    @@@ ruby
    class Farm
    end

    class Zoo
    end

!SLIDE smaller
## Composition (mixin)
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end
####
    @@@ ruby
    class Farm
      include AnimalSounds
    end

    class Zoo
      include AnimalSounds
    end

    Farm.new.common_sounds
    Zoo.new.common_sounds

!SLIDE smaller
## Composition (mixin)
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end
####
    @@@ ruby
    class Farm
      include AnimalSounds
    end

    class Zoo
      include AnimalSounds
    end

    Farm.new.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]
    Zoo.new.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE smaller
## Composition (multiple mixins)
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    module HumanSounds
      def common_sounds
        ["Titta där!", "Jag vill gå hem!", "Mata ej tapiren!"]
      end
    end

####
    @@@ ruby
    class Zoo
      include AnimalSounds
      include HumanSounds
    end

    Zoo.new.common_sounds

!SLIDE smaller
## Composition (multiple mixins)
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    module HumanSounds
      def common_sounds
        ["Titta där!", "Jag vill gå hem!", "Mata ej tapiren!"]
      end
    end

####
    @@@ ruby
    class Zoo
      include AnimalSounds
      include HumanSounds
    end

    Zoo.new.common_sounds # => Titta där!, Jag vill gå hem!, Mata ej tapiren!

!SLIDE smaller
## Composition (multiple mixins)
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    module HumanSounds
      def common_sounds
        super + ["Titta där!", "Jag vill gå hem!", "Mata ej tapiren!"]
      end
    end

####
    @@@ ruby
    class Zoo
      include AnimalSounds
      include HumanSounds
    end

    Zoo.new.common_sounds

!SLIDE smaller
## Composition (multiple mixins)
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    module HumanSounds
      def common_sounds
        super + ["Titta där!", "Jag vill gå hem!", "Mata ej tapiren!"]
      end
    end

####
    @@@ ruby
    class Zoo
      include AnimalSounds
      include HumanSounds
    end

    puts Zoo.new.common_sounds
    # => ["VOFF", "Mjau", "Grymt", "Bää", "Titta där!", "Jag vill gå hem",
    #     "Mata ej tapiren!"]

!SLIDE smaller
## Interface
    @@@ ruby
    class Animal
      include Enumerable

      def each
        yield "VOFF"
        yield "Mjau"
        yield "Grymt"
        yield "Bää"
      end
    end

    puts Animal.new.sort

!SLIDE smaller
## Interface
    @@@ ruby
    class Animal
      include Enumerable

      def each
        yield "VOFF"
        yield "Mjau"
        yield "Grymt"
        yield "Bää"
      end
    end

    puts Animal.new.sort # => Bää Grymt Mjau Voff

!SLIDE smaller
## Fler variabeltyper

!SLIDE smaller
## Fler variabeltyper
### (som knappt inte används)

!SLIDE smaller
## Fler variabeltyper
### (som knappt inte används)

* Globala variabler
* Klassvariabler

!SLIDE smaller
## Globala variabler
    @@@ ruby
    $foo = "bar"
    $foo

!SLIDE smaller
## Globala variabler
    @@@ ruby
    $foo = "bar"
    $foo # => bar

!SLIDE smaller
## Globala variabler
    @@@ ruby
    $foo

!SLIDE smaller
## Globala variabler
    @@@ ruby
    $foo # => nil

!SLIDE smaller
## Globala variabler
    @@@ ruby
    $$ # PID
    $? # Exit status of last executed child process
    $0 # The name of the ruby script file

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    Animal.sound

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    Animal.sound # => Oidentifierbart

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    class Dog < Animal
    end

    Dog.sound

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    class Dog < Animal
    end

    Dog.sound # => Oidentifierbart

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    class Dog < Animal
      @@sound = "VOFF!"
    end

    Dog.sound

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    class Dog < Animal
      @@sound = "VOFF!"
    end

    Dog.sound # => VOFF!

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    class Dog < Animal
      @@sound = "VOFF!"
    end

    Dog.sound # => VOFF!
    Animal.sound

!SLIDE smaller
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    class Dog < Animal
      @@sound = "VOFF!"
    end

    Dog.sound # => VOFF!
    Animal.sound # => VOFF!
