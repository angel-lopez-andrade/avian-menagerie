# Note - array-counting from 0 but postgresql id initialization from 1
# Note - :references columns mandatory

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
# Picture attached
breed_names = ["Budgey", "Cockatoo", "Parrot", "Owl", "Penguin", "Pidgeon", "Seagull", "Ostrich", "Falcon", "Goose", "Crow", "Woodpecker", "Cormorant", "Swan", "Stork"]
breed_ids = []
if Breed.count == 0
    for i in 0...breed_names.length
        b = Breed.create(
            name: breed_names[i]
        )
        temp_img_variable = Down.download(HTTParty.get("http://shibe.online/api/birds").parsed_response[0])
        b.pic.attach(io: temp_img_variable, filename: File.basename(temp_img_variable.path))
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
# username field only for admin - all other users have email only
# Picture attached
if User.count == 0
    u = User.create(
        username: "admin",
        email: "admin@site.com",
        password: "admin123"
    )
    u.pic.attach(io: File.open("app/assets/images/admin_user_icon.png"), filename: "admin_icon.png")
    p "User - Admin"
end

# Bird - Individual named birds, each belonging to a breed (however, seeded birds do not belong to any user - thus no user_id declaration)
# Picture attached
if Bird.count == 0
    for i in 1..25
        breed_id = breed_ids.sample
        breed_colors = Breed.find(breed_id).bird_colors
        b = Bird.create(
            name: Faker::Creature::Horse.name,
            age: rand(3..15),
            price: rand(5000..100000),
            description: Faker::Lorem.paragraphs(number: 3),
            color: breed_colors[rand(0...breed_colors.length)].name,
            breed_id: breed_id,
            user_id: 1
        )
        temp_img_variable = Down.download(HTTParty.get("http://shibe.online/api/birds").parsed_response[0])
        b.pic.attach(io: temp_img_variable, filename: File.basename(temp_img_variable.path))
        p "Bird - #{b.name}, #{b.age} years, $#{b.price / 100.0}, Breed: #{b.breed.name}, Color: #{b.color}"
    end
end

# SnackVariety - Collections of related snacks
snack_varieties = ["Seeds", "Fruits", "Insects", "Vegetations"]
snack_variety_ids = []
if SnackVariety.count == 0
    for i in 0...snack_varieties.length
        SnackVariety.create(
            name: snack_varieties[i]
        )
        snack_variety_ids.push(SnackVariety.last.id)
        p "SnackVariety - #{SnackVariety.last.name}"
    end
end

# Snack - Individual types of snacks within each variety
# Picture attached (to be)
snacks = {
    seeds: ["sunflower", "pumpkin", "millet", "thistle", "sorghum", "flax"],
    fruits: ["apple", "grape", "pear", "orange", "cherry", "plum", "melon", "strawberry"],
    insects: ["earthworm", "ant", "budworm", "fly", "mosquito", "caterpillar"],
    vegetations: ["grass", "moss", "nectar", "lichen", "tree sap", "leaves"]
}
if Snack.count == 0
    snacks.each do |key, value|
        for snack in snacks[key]
            s = Snack.create(
                name: snack.capitalize,
                snack_variety_id: SnackVariety.find_by_name(key.to_s.capitalize).id
            )
            case key
            when :seeds
                temp_img_variable = Down.download("https://loremflickr.com/320/240/seed")
            when :fruits
                temp_img_variable = Down.download("https://loremflickr.com/320/240/fruit")
            when :insects
                temp_img_variable = Down.download("https://loremflickr.com/320/240/insect")
            when :vegetations
                temp_img_variable = Down.download("https://loremflickr.com/320/240/vegetation")
            end
            s.pic.attach(io: temp_img_variable, filename: File.basename(temp_img_variable.path))
            p "Snack - #{Snack.last.name}, Variety: #{SnackVariety.find(Snack.last.snack_variety_id).name}"
        end
    end
end

# CageVariety - Collections of related cages
cage_varieties = ["Plastic", "Wooden", "Metal"]
cage_variety_ids = []
if CageVariety.count == 0
    for i in 0...cage_varieties.length
        CageVariety.create(
            name: cage_varieties[i]
        )
        cage_variety_ids.push(CageVariety.last.id)
        p "CageVariety - #{CageVariety.last.name}"
    end
end

# Cage - Individual types of cages within each variety
# Picture attached (to be)
cage_sizes = ["small", "medium", "large"]
if Cage.count == 0
    for variety in cage_varieties
        for size in cage_sizes
            c = Cage.create(
                name: "#{size.capitalize} #{variety}",
                cage_variety_id: CageVariety.find_by_name(variety.capitalize).id
            )
            temp_img_variable = Down.download("https://loremflickr.com/320/240/birdcage")
            c.pic.attach(io: temp_img_variable, filename: File.basename(temp_img_variable.path))
            p "Cage - #{Cage.last.name}, Variety: #{CageVariety.find(Cage.last.cage_variety_id).name}"
        end
    end
end