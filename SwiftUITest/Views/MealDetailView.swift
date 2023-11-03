//
//  ItemDetail.swift
//  SwiftUITest
//
//  Created by Ben Bueltmann on 10/31/23.
//

import SwiftUI

struct MealDetailView: View {
    
    let dessertId: String
    let bounds = UIScreen.main.bounds
    
    @ObservedObject var detailDataService: MealDetailDataService
    
    init(dessertId: String) {
        self.dessertId = dessertId
        self.detailDataService = MealDetailDataService(mealId: dessertId)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 2) {
                if let meal = detailDataService.meals.first {
                    
                    AsyncImage(
                        url: URL(string: meal.strMealThumb),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: bounds.width, maxHeight: 300)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .navigationTitle(meal.strMeal)
                    .navigationBarTitleDisplayMode(.inline)
                    
                    Spacer(minLength: 10)
                    
                    Text("Ingredients:")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer(minLength: 10)
                    
                    ForEach(Array(zip(meal.ingredients, meal.measurements)).indices, id: \.self) { index in
                        let ingredient = meal.ingredients[index]
                        let measurement = meal.measurements[index]
                        if !ingredient.isEmpty {
                            let capitalizedIngredient = ingredient.capitalized
                            HStack {
                                Text("\(capitalizedIngredient):")
                                    .font(.body)
                                Text(measurement)
                                    .font(.body)
                            }
                        }
                    }
                    
                    Spacer(minLength: 10)
                    
                    Text("Instructions:")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer(minLength: 10)
                    
                    Text(meal.strInstructions)
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .scrollIndicators(.hidden)
    }
}

#Preview {
    MealDetailView(dessertId: "53049")
}
