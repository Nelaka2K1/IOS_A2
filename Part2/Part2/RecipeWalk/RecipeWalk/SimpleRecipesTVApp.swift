import SwiftUI

@main
struct SimpleRecipesTVApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RecipeListView(recipes: Recipe.sampleRecipes)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
