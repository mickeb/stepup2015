module AnimalSounds
  def common_sounds
    ["VOFF", "Mjau", "Grymt", "Bää"]
  end
end

module HumanSounds
  def common_sounds
    super + ["Titta där!", "Jag vill gå hem", "Mata ej tapiren!"]
  end
end

class Zoo
  include AnimalSounds
  include HumanSounds
end

puts Zoo.new.common_sounds.inspect
