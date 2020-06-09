//
//  CreerUneRecette.swift
//  
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

struct CreateRecipe: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest(fetchRequest: RecipesItem.getAllRecipesItems()) var recipesItems:FetchedResults<RecipesItem>
    
    @State private var newRecipeItem = ""
    
    @State var titleWritten = ""
    @State var index = 0
    var categories = ["Petit-déjeuner", "Entrée", "Plat", "Dessert", "En-cas", "Apéritif", "Boisson"]
    @State var ingredientsList = [""]
    @State var ingredient = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Titre")) {
                        TextField("Titre de la recette", text: $titleWritten, onEditingChanged: { (sucess) in
                            print("On Editing: \(sucess)")
                        }) {
                            print("On commit")
                        }
                    }
                Section(header: Text("Catégorie")) {
                    Picker(selection: $index, label: Text("Catégorie")){
                        ForEach(0..<categories.count) { x in
                            Text(self.categories[x]).tag(x)
                        }
                    }
                }
                    
                    Section(header: Text("Ingédients")) {
                        VStack {
                            HStack {
                                TextField("Ingrédient", text: self.$ingredient)
                                Button(action: {
                                    guard self.ingredient != "" else {return}
                                    let new = self.ingredient
                                    
                                    self.ingredientsList.append(new)
                                    print(self.ingredientsList)
                                    
                                    self.ingredient = ""
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.red)
                                        .imageScale(.large)
                                }
                                                       
                            }
                        }
                    }
                        
                    
                    /*ForEach(0..<ingredientsList.count) { x in
                        TextField("Ingrédient", text: self.$titleWritten, onEditingChanged: { (sucess) in
                            print("On Editing: \(sucess)")
                        }) {
                            print("On commit")
                        }
                    }
                    Button(action: {
                        //
                    }) {
                        Text("Ajouter un ingrédient supplémentaire")
                    }*/
                    
                    Section(header: Text("Etapes")) {
                        ForEach(0..<ingredientsList.count) { x in
                            TextField("Etape", text: self.$titleWritten, onEditingChanged: { (sucess) in
                                print("On Editing: \(sucess)")
                            }) {
                                print("On commit")
                            }
                        }
                        Button(action: {
                            //
                        }) {
                            Text("Ajouter une étape")
                        }
                    }
                }
            }
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CreerUneRecette_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipe()
    }
}
