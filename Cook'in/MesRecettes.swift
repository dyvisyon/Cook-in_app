//
//  MesRecettes.swift
//
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

class Json: ObservableObject {
    @Published var json = [RecipeModel]()
    
    init() {
        load()
    }
    
    func load() {
        let path = Bundle.main.path(forResource: "Recipes", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([RecipeModel].self, from: data)
                    
                    DispatchQueue.main.sync {
                        self.json = json
                    }
                } else {
                    print("No data")
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

struct MesRecettes: View {
    
    @ObservedObject var datas = Json()
    
    var body: some View {
        NavigationView {
            VStack {
                List(datas.json) { item in
                    NavigationLink(destination: Recipe(jsonItem: item)) {
                        VStack {
                            Text(item.title)
                            //.font(.headline)
                            Text(item.category)
                                .foregroundColor(.gray)
                            //(/*@START_MENU_TOKEN@*/Color(red: 0.937, green: 0.498, blue: 0.447)/*@END_MENU_TOKEN@*/)
                        }
                        
                    }
                }
            }
            
        }.navigationBarTitle("Mes recettes")
        .navigationBarHidden(true)
        
    }
}

struct MesRecettes_Previews: PreviewProvider {
    static var previews: some View {
        MesRecettes()
    }
}

