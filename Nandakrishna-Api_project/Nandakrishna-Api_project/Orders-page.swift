//
//  Orders-page.swift
//  Nandakrishna-Api_project
//
//  Created by Nxt Wave mac mini 3 on 09/08/25.
//

import SwiftUI
import Combine


final class Order : ObservableObject{
    @Published var orders : [Recipe] = []
    
    var totalprice : Double{
        Double(orders.reduce(0){$0+$1.reviewCount})
    }
}

struct Orders_page: View {
    let recipe: Recipe
    var body: some View {
        VStack{
            Text("Orders")
                .font(.system(size: 35, weight: .bold))
                .padding()
            
            Divider()
            
            HStack{
                AppetizerRemoteImage(urlString: recipe.image)
                    .frame(width:100,height: 80)
                
                VStack(alignment: .leading){
                    Text(recipe.name)
                    Text(String("$\(recipe.reviewCount)"))
                }
                .padding()
                Spacer()
                
            }
            .padding()
            
            Spacer()
            
            
            Button {
                
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
}















#Preview {
    Orders_page(recipe: Recipe(
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
