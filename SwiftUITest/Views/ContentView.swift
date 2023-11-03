//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Ben Bueltmann on 10/31/23.
//


import Foundation
import SwiftUI
import Combine


struct ContentView: View {
    
    @ObservedObject var dataService = MealListDataService()
    
    var body: some View {
        NavigationStack {
            List(dataService.meals.sorted(by: {$0.strMeal < $1.strMeal}) ) { meal in
                NavigationLink {
                    MealDetailView(dessertId: meal.idMeal)
                } label: {
                    MealRow(meal: meal)
                }
            }
            .navigationTitle("Desserts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
