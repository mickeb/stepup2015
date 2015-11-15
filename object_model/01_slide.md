!SLIDE smaller
# Rubys objektsmodell + variabler

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
# Klassdefinition (tillbaka)
    @@@ ruby
    class Animal
    end

!SLIDE smaller
# Instansiering
    @@@ ruby
    class Animal
    end

    animal = Animal.new

!SLIDE smaller
# Instansiering
    @@@ ruby
    class Animal
    end

    animal = Animal.new
    animal # => #<Animal:0x007fd5fc110560>

!SLIDE smaller

# Lokala variabler

* Alltid snake_case
* Scope

!SLIDE smaller

## snake_case
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
      puts foo
      foo = "foo2"
      puts foo
      bar = "bar"
    end

    baz()

    foo
    bar

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    def baz
      puts foo # => undefined local variable or method `foo' for main:Object
      foo = "foo2"
      puts foo # => "foo2"
      bar = "bar"
    end

    baz()

    foo # => "foo"
    bar # => undefined local variable or method `bar' for main:Object .....

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    foo
    bar

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    foo # => "foo2"
    bar # => "bar"

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
      bar = "bar"
    end

    foo
    bar

!SLIDE smaller
## Scope
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
      bar = "bar"
    end

    foo # => "foo"
    bar # => nil

!SLIDE smaller
# Instansiering (tillbaka)
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
    animal.sound

!SLIDE smaller
# Instansmetod
    @@@ ruby
    class Animal
      def sound
        "grymt!"
      end
    end

    animal = Animal.new # => #<Animal:0x007fd5fc110560>
    animal.sound # => "grymt!"

!SLIDE execute smaller
# Subklass
## (med arv och överskuggning)
    @@@ ruby
    class Dog < Animal
      def sound
        "VOFF!"
      end
    end

    dog = Dog.new
    dog.sound

!SLIDE smaller
# Subklass
## (med arv och överskuggning)
    @@@ ruby
    class Dog < Animal
      def sound
        "VOFF!"
      end
    end

    dog = Dog.new # => #<Dog:0x007fd5fc110560>
    dog.sound # => "VOFF!"

!SLIDE smaller
# Subklass
## (konstruktor och instansvariabel)
    @@@ ruby
    class Dog < Animal
      attr_reader :owner

      def initialize(owner)
        @owner = owner
      end

      def sound
        "VOFF!"
      end
    end

    animal = Dog.new("Micke")

    animal.sound
    animal.owner

!SLIDE smaller

# Instansvariabler

* Prefixas med @
* snake_case
* Visibility
* Scope

!SLIDE smaller
## Prefixas med @
    @@@ ruby
    @foo = bar

!SLIDE smaller

## snake_case
### Bra:

    @@@ ruby
    @my_var = 42

### Dåligt:
    @@@ ruby
    @myVar = 42

!SLIDE smaller
## Visibility
    @@@ ruby
    class Animal
      def initialize
        @sound = "morr"
      end
    end

    Animal.new.sound

!SLIDE smaller
## Visibility
    @@@ ruby
    class Animal
      def initialize
        @sound = "morr"
      end
    end

    Animal.new.sound # undefined method `sound' for #<Animal:0x007fb9a...

!SLIDE smaller
    @@@ ruby
    class Animal
      def initialize
        @sound = "morr"
      end

      def sound
        @sound
      end
    end

    Animal.new.sound

!SLIDE smaller
    @@@ ruby
    class Animal
      def initialize
        @sound = "morr"
      end

      def sound
        @sound
      end
    end

    Animal.new.sound # => "morr"

!SLIDE smaller
    @@@ ruby
    class Animal
      def sound
        @sound
      end
    end

    Animal.new.sound

!SLIDE smaller
    @@@ ruby
    class Animal
      def sound
        @sound
      end
    end

    Animal.new.sound # => nil

!SLIDE smaller
    @@@ ruby
    class Animal
      def initialize(sound_id)
        @sound_id = sound_id
      end

      def sound
        @sound ||= Sound.find(sound_id)
      end
    end

!SLIDE smaller
# Subklass
## Konstruktor och instansvariabel (tillbaka)
    @@@ ruby
    class Dog < Animal
      attr_reader :owner

      def initialize(owner)
        @owner = owner
      end

      def sound
        "VOFF!"
      end
    end

    animal = Dog.new("Micke")

    animal.sound
    animal.owner

!SLIDE smaller
# Subklass
## (konstruktor och instansvariabel)
    @@@ ruby
    class Dog < Animal
      attr_reader :owner

      def initialize(owner)
        @owner = owner
      end

      def sound
        "VOFF!"
      end
    end

    animal = Dog.new("Micke") # => #<Dog:0x007fd5fc110560>

    animal.sound # => "VOFF!"
    animal.owner # => "Micke"

!SLIDE smaller
# Subklass
## (anrop till basklass metod)
    @@@ ruby
    class Tax < Dog
      attr_reader :name

      def initialize(owner, name)
        super(owner)

        @name = name
      end

      def sound
        "#{super.downcase}..gläffs!"
      end
    end

    animal = Tax.new("Micke", "Max")

    animal.sound
    animal.owner
    animal.name

!SLIDE smaller
# Subklass
## (anrop till basklass metod)
    @@@ ruby
    class Tax < Dog
      attr_reader :name

      def initialize(owner, name)
        super(owner)

        @name = name
      end

      def sound
        "#{super.downcase}..gläffs!"
      end
    end

    animal = Tax.new("Micke", "Max")

    animal.sound # => "voff!..gläffs!"
    animal.owner # => "Micke"
    animal.name # => "Max"

!SLIDE smaller
# Då har vi grunderna

!SLIDE smaller
# Låt oss gå vidare

!SLIDE smaller

# Klassmetoder

!SLIDE smaller
# Animal.new

!SLIDE smaller
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.common_sounds

!SLIDE smaller
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE smaller
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
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Dog < Animal
    end

    Dog.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE smaller
# Öppna klasser

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal = Animal.new
    animal.sound

!SLIDE smaller

    @@@ ruby
    class Animal
    end

    animal = Animal.new
    animal.sound # = undefined method `sound' for #<Animal:0x007...

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    class Animal
      def sound
        "Mjau"
      end
    end

    animal = Animal.new
    animal.sound

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    class Animal
      def sound
        "Mjau"
      end
    end

    animal = Animal.new
    animal.sound # => "Mjau"

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    def animal.sound
      "Mjau"
    end

    animal.sound

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    def animal.sound
      "Mjau"
    end

    animal.sound # => "Mjau"

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    def Animal.common_sounds
      ["VOFF", "Mjau", "Grymt", "Bää"]
    end

    Animal.common_sounds

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    def Animal.common_sounds
      ["VOFF", "Mjau", "Grymt", "Bää"]
    end

    Animal.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE smaller
# Ner på djupet

!SLIDE smaller
# #class

!SLIDE smaller
# #class
## Returns the class of obj

!SLIDE smaller
    @@@ ruby
    "VOFF".class

!SLIDE smaller
    @@@ ruby
    "VOFF".class # => String

!SLIDE smaller
    @@@ ruby
    "VOFF".class # => String
    animal.class

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

!SLIDE smaller center
## Översikt
![Ruby](http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png)
### http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png

!SLIDE smaller
## "Classes in Ruby are first-class objects - each is an instance of class Class"

!SLIDE smaller
# Klassmetod

!SLIDE smaller
# Klassmetod?
## ==
# instansmetod i instanser av klassen Class

!SLIDE smaller
# Singletonklass
##(aka Metaclass, Shadowclass, Eigenclass)

!SLIDE smaller

## Alla objekt i ruby har en singletonklass associerad till sig

!SLIDE smaller

## Alla objekt i ruby har en singletonklass associerad till sig
## som inte existerar

!SLIDE smaller

## Alla objekt i ruby har en singletonklass associerad till sig
## som inte existerar
## förrän den refereras

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    Animal.singleton_class
    animal.singleton_class

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    Animal.singleton_class # => #<Class:Animal>
    animal.singleton_class # => #<Class:#<Animal:0x007fe53a28c5e0>>

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal1 = Animal.new
    animal2 = Animal.new

    def animal1.sound
      "Mjau"
    end

    animal1.sound
    animal2.sound

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal1 = Animal.new
    animal2 = Animal.new

    def animal1.sound
      "Mjau"
    end

    animal1.sound # => "Mjau"
    animal2.sound # => undefined method `sound' for #<Animal:0x007...

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal1 = Animal.new
    animal2 = Animal.new

    def animal1.sound
      "Mjau"
    end

    animal1.singleton_class.instance_methods(false)
    animal2.singleton_class.instance_methods(false)

!SLIDE smaller
    @@@ ruby
    class Animal
    end

    animal1 = Animal.new
    animal2 = Animal.new

    def animal1.sound
      "Mjau"
    end

    animal1.singleton_class.instance_methods(false) # => [:sound]
    animal2.singleton_class.instance_methods(false) # => []

!SLIDE smaller
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.singleton_class.instance_methods(false)

!SLIDE smaller
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.singleton_class.instance_methods(false) # => [:common_sounds]

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
