import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @StateObject private var timerViewModel: RecipeTimerViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(recipe: Recipe) {
        self.recipe = recipe
        _timerViewModel = StateObject(wrappedValue: RecipeTimerViewModel(cookingTimeMinutes: recipe.cookingTimeMinutes))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Image
                ZStack(alignment: .bottomLeading) {
                    Image(recipe.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .clipped()
                    
                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.7)]), 
                                 startPoint: .top, 
                                 endPoint: .bottom)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(recipe.title)
                            .font(.system(size: 48, weight: .bold, design: .default))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 2)
                        
                        Text(recipe.description)
                            .font(.title3)
                            .foregroundColor(.white.opacity(0.9))
                            .padding(.bottom, 4)
                        
                        HStack(spacing: 16) {
                            HStack(spacing: 4) {
                                Image(systemName: "clock")
                                Text("\(recipe.cookingTimeMinutes) min")
                            }
                            
                            HStack(spacing: 4) {
                                Image(systemName: "fork.knife")
                                Text("\(recipe.ingredients.count) ingredients")
                            }
                        }
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.9))
                    }
                    .padding()
                }
                .cornerRadius(16)
                .shadow(radius: 8)
                .padding(.bottom)
                
                // Timer Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Cooking Timer")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text(timerViewModel.timeString)
                            .font(.system(size: 48, weight: .bold, design: .rounded))
                            .monospacedDigit()
                            .frame(minWidth: 200)
                        
                        Button(action: {
                            if timerViewModel.isRunning {
                                timerViewModel.stopTimer()
                            } else if timerViewModel.timeRemaining == 0 {
                                timerViewModel.resetTimer()
                            } else {
                                timerViewModel.startTimer()
                            }
                        }) {
                            Text(timerViewModel.timeRemaining == 0 ? "Reset" : (timerViewModel.isRunning ? "Stop" : "Start Timer"))
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(timerViewModel.isRunning ? Color.red : Color.blue)
                                .cornerRadius(12)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                    //.background(Color(.systemGray6))
                    .cornerRadius(16)
                }
                .padding(.horizontal)
                
                // Ingredients Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            HStack(alignment: .top) {
                                Image(systemName: "circle.fill")
                                    .font(.caption)
                                    .foregroundColor(.blue)
                                    .padding(.top, 4)
                                Text(ingredient)
                                    .font(.body)
                            }
                        }
                    }
                    .padding()
                    //.background(Color(.systemGray6))
                    .cornerRadius(16)
                }
                .padding(.horizontal)
                
                // Steps Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Steps")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(Array(recipe.steps.enumerated()), id: \.offset) { index, step in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Step \(index + 1)")
                                    .font(.headline)
                                    .foregroundColor(.blue)
                                Text(step)
                                    .font(.body)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            //.background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .padding(.top)
        }
        .ignoresSafeArea(edges: .top)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    NavigationView {
        RecipeDetailView(recipe: Recipe.sampleRecipes[0])
    }
}
