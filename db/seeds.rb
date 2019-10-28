#BirdColor
colors = ["Brown", "Grey", "Red", "Black", "White", "Blue", "Orange", "Green", "Yellow", "Purple"]
if BirdColor.count == 0
    for i in 0..colors.length - 1
        BirdColor.create(
            name: colors[i]
        )
        p "BirdColor = #{BirdColor.last.name}"
    end    
end

