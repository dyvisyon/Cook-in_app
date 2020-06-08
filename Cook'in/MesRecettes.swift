//
//  MesRecettes.swift
//
//
//  Created by Ivann Galic on 04/06/2020.
//

import SwiftUI

struct Model: Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case title
        case category
        case ingredients
        case steps
    }
    
    var id = UUID()
    var title, category: String
    var ingredients: [String]
    var steps: [String]
}

class Json: ObservableObject {
    @Published var json = [Model]()
    
    init() {
        load()
    }
    
    func load() {
        let path = Bundle.main.path(forResource: "Recipes", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let json = try JSONDecoder().decode([Model].self, from: data)
                    
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
            List(datas.json) { item in
                Text(item.title)
                Text(item.category)
                ForEach(0..<item.ingredients.count) { x in
                    Text(item.ingredients[x])
                }
                ForEach(0..<item.steps.count) { x in
                    Text(item.steps[x])
                }
                
                
                    
                
            }
        .navigationBarTitle("Mes Recettes")
        .navigationBarItems(trailing: EditButton())
        }
    }
    
}

struct MesRecettes_Previews: PreviewProvider {
    static var previews: some View {
        MesRecettes()
    }
}

