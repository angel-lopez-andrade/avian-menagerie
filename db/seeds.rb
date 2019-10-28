#BirdColor
colors = ["Brown", "Grey", "Red", "Black", "White", "Blue", "Orange", "Green", "Yellow", "Purple"]
if BirdColor.count == 0
    for i in 0..colors.length - 1
        BirdColor.create(
            name: colors[i]
        )
        p "BirdColor - #{BirdColor.last.name}"
    end
end

#Breed
breed_names = ["Budgey", "Cockatoo", "Parrot", "Owl", "Penguin", "Pidgeon", "Seagull", "Ostrich", "Falcon", "Goose", "Crow", "Woodpecker", "Cormorant", "Swan", "Stork"]
if Breed.count == 0
    for i in 0..breed_names.length - 1
        Breed.create(
            name: breed_names[i],
        )
        p "Breed - #{Breed.last.name}"
    end
end