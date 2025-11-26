import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let ingredients: [String]
    let steps: [String]
    let cookingTimeMinutes: Int
    
    static let sampleRecipes: [Recipe] = [
        Recipe(
            title: "Spaghetti Bolognese",
            description: "A classic Italian pasta dish.",
            imageName: "spaghetti",
            ingredients: [
                "400g spaghetti",
                "500g ground beef",
                "1 onion, diced",
                "2 garlic cloves, minced",
                "400g canned tomatoes",
                "2 tbsp tomato paste",
                "1 tsp dried oregano",
                "Salt and pepper to taste"
            ],
            steps: [
                "Cook spaghetti according to package instructions.",
                "Brown the ground beef in a pan over medium heat.",
                "Add onion and garlic, cook until softened.",
                "Stir in tomatoes, tomato paste, and seasonings.",
                "Simmer for 15-20 minutes.",
                "Serve over cooked spaghetti."
            ],
            cookingTimeMinutes: 30
        ),
        Recipe(
            title: "Grilled Chicken Bowl",
            description: "Healthy and protein rich.",
            imageName: "chicken_bowl",
            ingredients: [
                "2 chicken breasts",
                "1 cup quinoa",
                "2 cups mixed greens",
                "1 avocado, sliced",
                "1 cup cherry tomatoes, halved",
                "2 tbsp olive oil",
                "Salt and pepper to taste"
            ],
            steps: [
                "Season chicken with salt and pepper.",
                "Grill for 6-7 minutes per side.",
                "Cook quinoa according to package instructions.",
                "Slice chicken and assemble bowls with all ingredients.",
                "Drizzle with olive oil and serve."
            ],
            cookingTimeMinutes: 25
        ),
        Recipe(
            title: "Chocolate Cake",
            description: "Soft, rich and moist.",
            imageName: "chocolate_cake",
            ingredients: [
                "1 3/4 cups all-purpose flour",
                "2 cups sugar",
                "3/4 cup cocoa powder",
                "1 1/2 tsp baking powder",
                "1 1/2 tsp baking soda",
                "1 tsp salt",
                "2 eggs",
                "1 cup milk",
                "1/2 cup vegetable oil",
                "2 tsp vanilla extract",
                "1 cup boiling water"
            ],
            steps: [
                "Preheat oven to 350°F (175°C).",
                "Mix dry ingredients in a bowl.",
                "Add eggs, milk, oil and vanilla, beat for 2 minutes.",
                "Stir in boiling water (batter will be thin).",
                "Pour into greased pans.",
                "Bake for 30-35 minutes.",
                "Let cool before frosting."
            ],
            cookingTimeMinutes: 50
        ),
        Recipe(
            title: "Avocado Toast",
            description: "Quick and trendy breakfast.",
            imageName: "avocado_toast",
            ingredients: [
                "2 slices whole grain bread",
                "1 ripe avocado",
                "2 eggs",
                "Red pepper flakes",
                "Salt and pepper to taste",
                "Lemon juice (optional)",
                "Fresh herbs for garnish"
            ],
            steps: [
                "Toast the bread until golden.",
                "Mash the avocado and season with salt, pepper, and lemon juice.",
                "Spread avocado on toast.",
                "Fry or poach eggs to your liking.",
                "Top toast with eggs, red pepper flakes, and herbs."
            ],
            cookingTimeMinutes: 10
        ),
        Recipe(
            title: "Fried Rice",
            description: "Fast comfort food.",
            imageName: "fried_rice",
            ingredients: [
                "2 cups cooked rice (preferably day-old)",
                "2 eggs, beaten",
                "1 cup mixed vegetables (peas, carrots, corn)",
                "2 tbsp soy sauce",
                "1 tbsp sesame oil",
                "2 green onions, chopped",
                "2 cloves garlic, minced",
                "1 tbsp vegetable oil"
            ],
            steps: [
                "Heat vegetable oil in a large pan over medium heat.",
                "Add garlic and vegetables, cook until tender.",
                "Push vegetables to one side, add eggs to the other side.",
                "Scramble eggs, then mix with vegetables.",
                "Add rice and stir to combine.",
                "Stir in soy sauce and sesame oil.",
                "Cook for 2-3 more minutes, stirring occasionally.",
                "Garnish with green onions and serve."
            ],
            cookingTimeMinutes: 15
        )
    ]
}
