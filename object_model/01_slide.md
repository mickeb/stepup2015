!SLIDE small
# Rubys objektsmodell + variabler

!SLIDE small
# Låt oss börja från grunden

!SLIDE small
# Klassdefinition
    @@@ ruby
    class Animal
    end

!SLIDE small

# Konstanter

* Börjar alltid med stor bokstav
* Klasser, moduler eller värden
* Kan näslas

!SLIDE small

## Börjar alltid med stor bokstav
### MyConstant
### MY_CONSTANT

!SLIDE small

## Klasser, moduler eller värden

    @@@ ruby
    class Animal; end
    module House; end
####
    @@@ ruby
    MY_CONSTANT = 1

!SLIDE small

## Kan nässlas

    @@@ ruby
    class Animal
      NUMBER_OF_SPECIES = 8700000
    end

    Animal::NUMBER_OF_SPECIES # => 8700000

!SLIDE small
# Klassdefinition (tillbaka)
    @@@ ruby
    class Animal
    end

!SLIDE small
# Instansiering
    @@@ ruby
    class Animal
    end

    animal = Animal.new

!SLIDE small
# Instansiering
    @@@ ruby
    class Animal
    end

    animal = Animal.new
    animal # => #<Animal:0x007fd5fc110560>

!SLIDE small

# Lokala variabler

* Alltid snake_case
* Scope

!SLIDE small

## snake_case
### Bra:

    @@@ ruby
    my_var = 42

### Dåligt:
    @@@ ruby
    myVar = 42

!SLIDE small

## Scope

Scope avgränsas av nyckelorden **class**, **module**, **def** samt **block syntax**

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    foo
    bar

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    foo # => "foo2"
    bar

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if true
      foo = "foo2"
      bar = "bar"
    end

    foo # => "foo2"
    bar # => "bar"

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
      bar = "bar"
    end

    foo
    bar

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
      bar = "bar"
    end

    foo # => "foo"
    bar

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
      bar = "bar"
    end

    foo # => "foo"
    bar # => nil

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
    end

    foo # => "foo"
    bar

!SLIDE small
## Scope
    @@@ ruby
    foo = "foo"

    if false
      foo = "foo2"
    end

    foo # => "foo"
    bar # => undefined local variable or method \`bar' for ...

!SLIDE small
# Instansiering (tillbaka)
    @@@ ruby
    class Animal
    end

    animal = Animal.new
    animal # => #<Animal:0x007fd5fc110560>

!SLIDE small
# Instansmetod
    @@@ ruby
    class Animal
      def sound
        "grymt!"
      end
    end

    animal = Animal.new
    animal.sound

!SLIDE small
# Instansmetod
    @@@ ruby
    class Animal
      def sound
        "grymt!"
      end
    end

    animal = Animal.new # => #<Animal:0x007fd5fc110560>
    animal.sound # => "grymt!"

!SLIDE execute small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small

# Instansvariabler

* Prefixas med @
* snake_case
* Visibility
* Scope

!SLIDE small
## Prefixas med @
    @@@ ruby
    @foo = bar

!SLIDE small

## snake_case
### Bra:

    @@@ ruby
    @my_var = 42

### Dåligt:
    @@@ ruby
    @myVar = 42

!SLIDE small
## Visibility
    @@@ ruby
    class Animal
      def initialize
        @sound = "morr"
      end
    end

    Animal.new.sound

!SLIDE small
## Visibility
    @@@ ruby
    class Animal
      def initialize
        @sound = "morr"
      end
    end

    Animal.new.sound # undefined method `sound' for #<Animal:0x007fb9a...

!SLIDE small
## Visibility
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

!SLIDE small
## Visibility
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

!SLIDE small
## Scope
    @@@ ruby
    class Animal
      def sound
        @sound
      end
    end

    Animal.new.sound

!SLIDE small
## Scope
    @@@ ruby
    class Animal
      def sound
        @sound
      end
    end

    Animal.new.sound # => nil

!SLIDE small
## Scope
    @@@ ruby
    class Animal
      def initialize(sound_id)
        @sound_id = sound_id
      end

      def sound
        @sound ||= Sound.find(sound_id)
      end
    end

!SLIDE small
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

    dog = Dog.new("Micke") # => #<Dog:0x007fd5fc110560>

    dog.sound # => "VOFF!"
    dog.owner # => "Micke"

!SLIDE small
# Subklass
## Anrop till basklass metod
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

    tax = Tax.new("Micke", "Max")

    tax.sound
    tax.owner
    tax.name

!SLIDE small
# Subklass
## Anrop till basklass metod
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

    tax = Tax.new("Micke", "Max")

    tax.sound # => "voff!..gläffs!"
    tax.owner # => "Micke"
    tax.name # => "Max"

!SLIDE small
# Synlighet/Inkapsling

!SLIDE small
## Synlighet/Inkapsling
* public
* private
* protected

!SLIDE small
## Synlighet/Inkapsling

    @@@ ruby
    class Animal
      def puplic_metod
        # ...
      end

      private

      def private_method
      # ...
      end

      protected

      def protected_method
        # ...
      end

      public

      def puplic_metod2
        # ...
      end      
    end

!SLIDE small
## Synlighet/Inkapsling
### private

    @@@ ruby
    class Animal

      def sound
        fetch_from_db
      end

      private

      def fetch_from_db
        "mjau!"
      end
    end

    Animal.new.fetch_from_db
    Animal.new.sound

!SLIDE small
## Synlighet/Inkapsling
### private

    @@@ ruby
    class Animal

      def sound
        fetch_from_db
      end

      private

      def fetch_from_db
        "mjau!"
      end
    end

    Animal.new.fetch_from_db
    # => private method `mjau' called for #<Animal:0x0
    Animal.new.sound

!SLIDE small
## Synlighet/Inkapsling
### private

    @@@ ruby
    class Animal

      def sound
        fetch_from_db
      end

      private

      def fetch_from_db
        "mjau!"
      end
    end

    Animal.new.fetch_from_db
    # => private method `mjau' called for #<Animal:0x0
    Animal.new.sound
    # => "mjau!"

!SLIDE small
## Synlighet/Inkapsling
### private

    @@@ ruby
    class Animal

      def sound
        self.fetch_from_db
      end

      private

      def fetch_from_db
        "mjau!"
      end
    end

    Animal.new.sound

!SLIDE small
## Synlighet/Inkapsling
### private

    @@@ ruby
    class Animal

      def sound
        self.fetch_from_db
      end

      private

      def fetch_from_db
        "mjau!"
      end
    end

    Animal.new.sound
    # => private method `fetch_from_db' called for #<Ani...

!SLIDE smaller
## Synlighet/Inkapsling
### protected
    @@@ ruby
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

    class Zebra < Animal; end

    lion = Lion.new
    zebra = Zebra.new
    human = Human.new

    lion.eat(zebra)
    human.eat(zebra)

!SLIDE smaller
## Synlighet/Inkapsling
### protected
    @@@ ruby
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

    class Zebra < Animal; end

    lion = Lion.new
    zebra = Zebra.new
    human = Human.new

    lion.eat(zebra)
    # => I (#<Zebra:0x04...>) was eaten by #<Lion:0x01...>
    human.eat(zebra)

!SLIDE smaller
## Synlighet/Inkapsling
### protected
    @@@ ruby
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

    class Zebra < Animal; end

    lion = Lion.new
    zebra = Zebra.new
    human = Human.new

    lion.eat(zebra)
    # => I (#<Zebra:0x04...>) was eaten by #<Lion:0x01...>
    human.eat(zebra)
    # => protected method `eaten_by_other_animal' called for #<Zebra:0x0

!SLIDE small
# Då har vi grunderna

!SLIDE small
# Låt oss gå vidare

!SLIDE small

# Klassmetoder

!SLIDE small
# Animal.new

!SLIDE small
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.common_sounds

!SLIDE small
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE small
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Dog < Animal
    end

    Dog.common_sounds

!SLIDE small
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Dog < Animal
    end

    Dog.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE small
# Öppna klasser

!SLIDE small
## Öppna klasser
    @@@ ruby
    class Animal
    end

    animal = Animal.new
    animal.sound

!SLIDE small
## Öppna klasser
    @@@ ruby
    class Animal
    end

    animal = Animal.new
    animal.sound # = undefined method \`sound' for #<Animal:0x007...

!SLIDE small
## Öppna klasser
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

!SLIDE small
## Öppna klasser
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

!SLIDE small
## Öppna klasser
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    def animal.sound
      "Mjau"
    end

    animal.sound

!SLIDE small
## Öppna klasser
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    def animal.sound
      "Mjau"
    end

    animal.sound # => "Mjau"

!SLIDE small
## Öppna klasser
    @@@ ruby
    class Animal
    end

    def Animal.common_sounds
      ["VOFF", "Mjau", "Grymt", "Bää"]
    end

    Animal.common_sounds

!SLIDE small
## Öppna klasser
    @@@ ruby
    class Animal
    end

    def Animal.common_sounds
      ["VOFF", "Mjau", "Grymt", "Bää"]
    end

    Animal.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE small
# Körbara klasser

!SLIDE small
## Körbara klasser
    @@@ ruby
    class Animal
      puts "hello"
    end

!SLIDE small
## Körbara klasser
    @@@ ruby
    class Animal
      puts "hello"
    end

    # "hello"

!SLIDE small
## Körbara klasser
    @@@ ruby
    class Animal
      def self.foo
        puts "hello"
      end

      self.foo
    end

!SLIDE small
## Körbara klasser
    @@@ ruby
    class Animal
      def self.foo
        puts "hello"
      end

      self.foo
    end

    # "hello"

!SLIDE small
## Körbara klasser
    @@@ ruby
    class Animal
      def self.foo
        puts "hello"
      end

      foo
    end

!SLIDE small
## Körbara klasser
    @@@ ruby
    class Animal
      def self.foo
        puts "hello"
      end

      foo
    end

    # "hello"

!SLIDE small
# Ner på djupet

!SLIDE small
# #class

!SLIDE small
# #class
## Returns the class of obj

!SLIDE small
    @@@ ruby
    "VOFF".class

!SLIDE small
    @@@ ruby
    "VOFF".class # => String

!SLIDE small
    @@@ ruby
    "VOFF".class # => String
    animal.class

!SLIDE small
    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal

!SLIDE small

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

!SLIDE small

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

###
    @@@ ruby
    Tax.class

!SLIDE small

    @@@ ruby
    "VOFF".class # => String
    animal.class # => Animal
    dog.class # => Dog

###
    @@@ ruby
    Tax.class # => Class

!SLIDE small center
## Översikt
![Ruby](http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png)
### http://skilldrick.co.uk/wp-content/uploads/2011/08/Ruby.png

!SLIDE small
## "Classes in Ruby are first-class objects - each is an instance of class Class"

!SLIDE small
# Klassmetod

!SLIDE small
# Klassmetod?
## ==
# instansmetod i instanser av klassen Class

!SLIDE small
# Singletonklass
##(aka Metaclass, Shadowclass, Eigenclass)

!SLIDE small

## Alla objekt i ruby har en singletonklass associerad till sig

!SLIDE small

## Alla objekt i ruby har en singletonklass associerad till sig
## (som inte existerar förrän den refereras)

!SLIDE small
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    Animal.singleton_class
    animal.singleton_class

!SLIDE small
    @@@ ruby
    class Animal
    end

    animal = Animal.new

    Animal.singleton_class # => #<Class:Animal>
    animal.singleton_class # => #<Class:#<Animal:0x007...

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.singleton_class.instance_methods(false)

!SLIDE small
    @@@ ruby
    class Animal
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animal.singleton_class.instance_methods(false)
    # => [:common_sounds]

!SLIDE small
# Moduler

!SLIDE small
## En modul
    @@@ ruby
    module Animals
    end

!SLIDE small
## Användningsområden

* Namespacing
* Composition
* Extending

!SLIDE small
## Namespacing (klass)

    @@@ ruby
    module Animals
      class Dog
      end
    end

!SLIDE small
## Namespacing (klass)

    @@@ ruby
    module Animals
      class Dog
      end
    end

    dog = Animals::Dog.new # => #<Animals::Dog:0x007fb31c0ac950>

!SLIDE small
## Namespacing (metod)
    @@@ ruby
    module Animals
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

!SLIDE small
## Namespacing (metod)
    @@@ ruby
    module Animals
      def self.common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    Animals.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
## Extending
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Animal
      extend AnimalSounds
    end

    Animal.common_sounds

!SLIDE small
## Extending
    @@@ ruby
    module AnimalSounds
      def common_sounds
        ["VOFF", "Mjau", "Grymt", "Bää"]
      end
    end

    class Animal
      extend AnimalSounds
    end

    Animal.common_sounds # => ["VOFF", "Mjau", "Grymt", "Bää"]

!SLIDE small
## Fler variabeltyper

!SLIDE small
## Fler variabeltyper
### (som knappt inte används)

!SLIDE small
## Fler variabeltyper
### (som knappt inte används)

* Globala variabler
* Klassvariabler

!SLIDE small
## Globala variabler
    @@@ ruby
    $foo = "bar"
    $foo

!SLIDE small
## Globala variabler
    @@@ ruby
    $foo = "bar"
    $foo # => bar

!SLIDE small
## Globala variabler
    @@@ ruby
    $foo

!SLIDE small
## Globala variabler
    @@@ ruby
    $foo # => nil

!SLIDE small
## Globala variabler
    @@@ ruby
    $$ # PID
    $? # Exit status of last executed child process
    $0 # The name of the ruby script file

!SLIDE small
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    Animal.sound

!SLIDE small
## Klassvariabler
    @@@ ruby
    class Animal
      @@sound = "Oidentifierbart"

      def self.sound
        @@sound
      end
    end

    Animal.sound # => Oidentifierbart

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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

!SLIDE small
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
