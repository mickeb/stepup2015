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
puts Animal.new.sound
