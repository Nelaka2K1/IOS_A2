import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Recipe Image
            ZStack(alignment: .bottomLeading) {
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                // Gradient overlay for better text visibility
                LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.3)]), 
                             startPoint: .top, 
                             endPoint: .bottom)
                
                // Cooking time badge
                VStack {
                    HStack {
                        Spacer()
                        HStack(spacing: 4) {
                            Image(systemName: "clock")
                                .font(.caption)
                            Text("\(recipe.cookingTimeMinutes) min")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        .padding(8)
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding(12)
                    Spacer()
                }
            }
            .cornerRadius(12)
            .shadow(radius: 4)
            
            // Recipe Info
            VStack(alignment: .leading, spacing: 8) {
                Text(recipe.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                
                Text(recipe.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .padding(.bottom, 2)
                
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.caption2)
                        Text("\(recipe.cookingTimeMinutes) min")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack(spacing: 4) {
                        Image(systemName: "fork.knife")
                            .font(.caption2)
                        Text("\(recipe.ingredients.count) items")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
        }
        //.background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .scaleEffect(isFocused ? 1.05 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isFocused)
        .focusable()
    }
    
    // Focus state for tvOS
    @FocusState private var isFocused: Bool
}

#Preview {
    RecipeCardView(recipe: Recipe.sampleRecipes[0])
        .frame(width: 400, height: 300)
        .previewLayout(.sizeThatFits)
        .padding()
}
