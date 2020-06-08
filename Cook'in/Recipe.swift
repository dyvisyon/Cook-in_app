//
//  Recipe.swift
//  Cook'in
//
//  Created by Ivann Galic on 08/06/2020.
//  Copyright © 2020 Kevin. All rights reserved.
//

import SwiftUI


struct Recipe: View {
    
    @State var jsonItem: RecipeModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text(self.jsonItem.title)
                    .font(.title)
                Text(self.jsonItem.category)
            }
//            .background(/*@START_MENU_TOKEN@*/Color(red: 0.937, green: 0.498, blue: 0.447)/*@END_MENU_TOKEN@*/)
//            .frame(width: 100, height: 50, alignment: .center)

        }

    }
}

struct Recipe_Previews: PreviewProvider {
    
    @State var jsonItem: RecipeModel
    
    static var previews: some View {
        Recipe(jsonItem: RecipeModel(title: "Pancakes", category: "catégorie", ingredients: ["1", "2"], steps: ["1", "2"]))
    }
}

