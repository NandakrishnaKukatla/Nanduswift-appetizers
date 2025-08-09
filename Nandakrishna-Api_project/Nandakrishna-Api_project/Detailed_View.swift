//
//  Detailed_View.swift
//  Nandakrishna-Api_project
//
//  Created by Nxt Wave mac mini 3 on 08/08/25.
//

import SwiftUI

struct Detailed_view: View {
    @State var addtoorder: Bool = false
    @State var goback: Bool = false
    let recipe: Recipe
    var body: some View {
        NavigationStack{
            ZStack{
                Color.gray.opacity(1)
                    .ignoresSafeArea()
                
                VStack{
                    
                    HStack{
                        Spacer()
                        Button {
                            goback.toggle()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                        }
                        .padding()
                    }
                    
                    
                    AppetizerRemoteImage(urlString: recipe.image)
                        .frame(width:150, height: 100)
                    
                    Text(recipe.name)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Text(recipe.instructions.joined(separator: "\n"))
                        .font(.system(size: 18,weight: .medium))
                        .padding()
                    
                    Text("Cook Time: \(recipe.cookTimeMinutes) minutes")
                        .font(.system(size: 15, weight: .semibold))
                    
                    Text("Calories: \(recipe.caloriesPerServing) per serving")
                        .font(.system(size: 15, weight: .semibold))
                    
                    Button {
                        addtoorder.toggle()
                    } label: {
                        Text(String("$\(recipe.reviewCount) -Add to order"))
                            .frame(width: 150, height: 35)
                            .background(Color.blue)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                        
                    }
                }
            }
            .navigationDestination(isPresented: $addtoorder){
                Orders_page(recipe: recipe)
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $goback){
                ContentView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    Detailed_view(recipe: Recipe(
        id: 1,
        name: "Sample Recipe",
        ingredients: ["Ingredient 1", "Ingredient 2"],
        instructions: [
                "Preheat the oven to 475°F (245°C).",
                "Roll out the pizza dough and spread tomato sauce evenly.",
                "Top with slices of fresh mozzarella and fresh basil leaves.",
                "Drizzle with olive oil and season with salt and pepper.",
                "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
                "Slice and serve hot."
              ],
        prepTimeMinutes: 10,
        cookTimeMinutes: 20,
        servings: 2,
        difficulty: .easy,
        cuisine: "Italian",
        caloriesPerServing: 300,
        tags: ["vegan"],
        userID: 1,
        image: "food_placeholder",
        rating: 4.5,
        reviewCount: 10,
        mealType: ["Lunch"]
    ))
}
