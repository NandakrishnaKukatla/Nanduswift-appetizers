//
//  ContentView.swift
//  Nandakrishna-Api_project
//
//  Created by Nxt Wave mac mini 3 on 07/08/25.
//

import SwiftUI


struct ContentView: View {
    
    @State private var recipes: [Recipe] = []
    @State private var errorMessage: String? = nil
    @State private var selectedRecipe: Recipe? = nil
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                Text(" Appetizers")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.horizontal)
                
                List(recipes, id: \.id) { recipe in
                    
                    HStack {
                        AppetizerRemoteImage(urlString: recipe.image)
                            .frame(width:100,height: 80)
                        Text(recipe.name)
                    }
                    .onTapGesture {
                        selectedRecipe = recipe
                    }
                }
                .fullScreenCover(item: $selectedRecipe) { recipe in
                    Detailed_view(recipe: recipe)
                }
            }
            .task {
                do {
                    recipes = try await NetworkManager.shared.getAppetizers()
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
