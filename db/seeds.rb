# Note - array-counting from 0 but postgresql id initialization from 1

# BirdColor - All possible colors that a bird species can be - Cannot be edited by users
colors = ["Brown", "Grey", "Red", "Black", "White", "Blue", "Orange", "Green", "Yellow", "Purple"]
bird_color_ids = []
if BirdColor.count == 0
    for i in 0...colors.length
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
    for i in 0...breed_names.length
        b = Breed.create(
            name: breed_names[i]
        )
        breed_ids.push(b.id)
        p "Breed - #{b.name}"
    end
end

# BirdColorsBreed - Defines the relationship between bird colors and bird breeds - each breed can have 1-3 occuring colors
# Pick 3 random colors from Birdcolor data to attach to an existing Breed, then remove any duplicate colors with .uniq
# One BirdColorsBreed instance must exist for each Breed instance in order to declare the latters' colors - Hence loop breed_ids.count times (as breed_ids.count = number of Breed's)
if BirdColorsBreed.count == 0
    for i in 0...breed_ids.length
        unique_colors = []
        3.times do
            unique_colors.push(BirdColor.find(rand(1...bird_color_ids.length)).id)
        end
        unique_colors = unique_colors.uniq
        x = 0
        unique_colors.length.times do
            BirdColorsBreed.create(
                bird_color_id: unique_colors[x],
                breed_id: Breed.find(breed_ids[i]).id
            )
            x += 1
            p "BirdColorsBreed - BID: #{BirdColorsBreed.last.breed_id}, BCID: #{BirdColorsBreed.last.bird_color_id}"
        end
    end
end

# User - Initialize admin user (all seeded Birds belong to admin user - id: 1) (Breeds are not allocated a user, despite being creatable)
User.create(
    username: "admin",
    password: "test123",
    email: "admin@test.com"
)

# Birds - Individual named birds, each belonging to a breed (however, seeded birds do not belong to any user - thus no user_id declaration)
if Bird.count == 0
    for i in 1..25
        breed_id = breed_ids.sample
        breed_colors = Breed.find(breed_id).bird_colors
        Bird.create(
            name: Faker::Creature::Horse.name,
            age: rand(3..15),
            price: rand(5000..100000),
            description: Faker::Lorem.paragraphs(number: 3),
            color: breed_colors[rand(0...breed_colors.length)].name,
            breed_id: breed_id,
            user_id: 1
        )
        p "Bird - #{Bird.last.name}, #{Bird.last.age} years, $#{Bird.last.price / 100.0}, Breed: #{Bird.last.breed.name}, Color: #{Bird.last.color}"
    end
end