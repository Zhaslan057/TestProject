//
//  HomeViewModel.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 30.03.2023.
//

import Foundation

struct Latest: Codable {
    let category, name, imageURL: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case name = "name"
        case price = "price"
        case imageURL = "image_url"
    }
}

struct List: Codable {
    var latest: [Latest]
}


class HomeViewModel: ObservableObject {
    @Published var products = [Latest]()
    
    func fetchProducts() {
        guard let url = URL(string: "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7") else {
            fatalError("Invalid URL")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                fatalError("No data received")
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let products = try decoder.decode(List.self, from: data)
            } catch {
                print(String(describing: error))
            }
        }.resume()
    }
}
