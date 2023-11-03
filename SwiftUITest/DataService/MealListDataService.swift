//
//  MealDataService.swift
//  SwiftUITest
//
//  Created by Ben Bueltmann on 11/1/23.
//

import Foundation

public class MealListDataService: ObservableObject {
    
    @Published var meals = [Meal]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let data = data {
                    let response = try JSONDecoder().decode(MealResponse.self, from: data)
                    DispatchQueue.main.async {
                        if let meals = response.meals {
                            self.meals = meals
                        }
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
