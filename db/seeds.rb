# Note - array-counting from 0 but postgresql id initialization from 1
# BirdColor - All possible colors that a bird species can be - Cannot be edited by users
colors = ["Brown", "Grey", "Red", "Black", "White", "Blue", "Orange", "Green", "Yellow", "Purple"]
bird_color_ids = []
if BirdColor.count == 0
    for i in 0..colors.length - 1
        bc = BirdColor.create(
            name: colors[i]
        )
        bird_color_ids.push(bc.id)
        p "BirdColor - #{bc.name}"
    end
end

# Breed - Breeds of bird - Can be added to by users
breed_names = ["Budgey", "Cockatoo", "Parrot", "Owl", "Penguin", "Pidgeon", "Seagull", "Ostrich", "Falcon", "Goose", "Crow", "Woodpecker", "Cormorant", "Swan", "Stork"]
breed_ids = []
if Breed.count == 0
    for i in 0..breed_names.length - 1
        b = Breed.create(
            name: breed_names[i]
        )
        breed_ids.push(b.id)
        p "Breed - #{b.name}"
    end
end

# BirdColorsBreed - Defines the relationship between bird colors and bird breeds - each breed can have 1-3 occuring colors
# Pick 1-3 random colors from Birdcolor data to attach to an existing Breed
# One BirdColorsBreed instance must exist for each Breed instance in order to declare the latters' colors - Hence loop breed_ids.count times (as breed_ids.count = number of Breed's)
if BirdColorsBreed.count == 0
    for i in 0..breed_ids.length - 1
        BirdColorsBreed.create(
            bird_color_id: BirdColor.find(rand(1..bird_color_ids.length)).id,
            breed_id: Breed.find(breed_ids[i]).id
        )
        p "BirdColorsBreed - #{BirdColorsBreed.last.bird_color_id}, #{BirdColorsBreed.last.breed_id}"
    end
end