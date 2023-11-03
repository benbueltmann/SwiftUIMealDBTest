//
//  RecipeRow.swift
//  SwiftUITest
//
//  Created by Ben Bueltmann on 10/31/23.
//

import SwiftUI

struct MealRow: View {
    
    var meal: Meal
    
    var body: some View {
        HStack {
            AsyncImage(
                  url: URL(string: meal.strMealThumb),
                  content: { image in
                      image.resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(maxWidth: 50, maxHeight: 50)
                  },
                  placeholder: {
                      ProgressView()
                  }
              )
            Text(meal.strMeal)
            Spacer()
        }
    }
}

#Preview {
    MealRow(meal: Meal(idMeal: "53049", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", strMeal: "Apam balik"))
}
