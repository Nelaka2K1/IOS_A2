import SwiftUI

struct RecipeListView: View {
    let recipes: [Recipe]
    
    // Grid layout for tvOS
    private let columns = [
        GridItem(.adaptive(minimum: 400, maximum: 500), spacing: 32)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("SimpleRecipes")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Delicious recipes for every occasion")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                // Recipe Grid
                LazyVGrid(columns: columns, spacing: 32) {
                    ForEach(recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeCardView(recipe: recipe)
                                .buttonStyle(CardButtonStyle())
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .padding(.vertical)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

// Custom button style for tvOS focus effects
struct CardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    NavigationView {
        RecipeListView(recipes: Recipe.sampleRecipes)
    }
}
