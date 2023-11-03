//
//  MealDetailDataService.swift
//  SwiftUITest
//
//  Created by Ben Bueltmann on 11/1/23.
//

import Foundation


public class MealDetailDataService: ObservableObject {
    
    @Published var meals = [MealDetail]()
    
    init(mealId: String){
        load(mealId: mealId)
    }
    
    func load(mealId: String) {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let data = data {
                    let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.meals = response.meals
                    }
                } else {
                    print("No Data")
                }
            } catch let parsingError {
                print ("Error", parsingError)
            }
        }.resume()
    }
}

