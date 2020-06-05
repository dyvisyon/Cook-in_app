//
//  Recette.swift
//  Cook'in
//
//  Created by Ivann Galic on 05/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import Foundation

public class Recette: ObservableObject, Identifiable {
    var title: String
    var category: String
    var ingredients: [String]
    
    init(title: String, category: String, ingredients: [String]) {
        self.title = title
        self.category = category
        self.ingredients = ingredients
    }
}
