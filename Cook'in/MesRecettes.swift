//
//  MesRecettes.swift
//  
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

struct MesRecettes: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest(fetchRequest: RecipesItem.getAllRecipesItems()) var recipesItems:FetchedResults<RecipesItem>
    
    @State private var newRecipeItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("")
                    }
                }
            }
        }
    .navigationBarTitle("Mes Recettes")
    .navigationBarItems(trailing: EditButton())
    }
}

struct MesRecettes_Previews: PreviewProvider {
    static var previews: some View {
        MesRecettes()
    }
}
