//
//  Meal.swift
//  SwiftUITest
//
//  Created by Ben Bueltmann on 11/1/23.
//

import Foundation

struct Meal: Codable, Identifiable {
    let idMeal: String
    let strMealThumb: String
    let strMeal: String
    var id: String { idMeal }
}

struct MealResponse: Codable {
    var meals: [Meal]?
}
