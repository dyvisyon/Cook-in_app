//
//  CreerUneRecette.swift
//  
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

struct CreerUneRecette: View {
    
    @State var titleWritten = ""
    @State var index = 0
    var categories = ["Petit-déjeuner", "Entrée", "Plat", "Dessert", "En-cas", "Apéritif", "Boisson"]
    @State var ingredientsList = [""]
    
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
                    ForEach(0..<ingredientsList.count) { x in
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
                    }
                }
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
        }.navigationBarTitle("Créer une recette")
    }
}

struct CreerUneRecette_Previews: PreviewProvider {
    static var previews: some View {
        CreerUneRecette()
    }
}
