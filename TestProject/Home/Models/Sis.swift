//
//  Sis.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 30.03.2023.
//

//import SwiftUI
//
//import SwiftUI
//
//struct Sis: View {
//    @State var data = [Post]()
//
//    var body: some View {
//        List(data) { post in
//            VStack(alignment: .leading) {
//                Text(post.title)
//                    .font(.headline)
//                Text(post.body)
//                    .font(.subheadline)
//            }
//        }
//        .task {
//            loadData()
//        }
//        .refreshable {
//            loadData()
//        }
////        .onAppear(perform: loadData)
//    }
//
//    func loadData() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
//                    DispatchQueue.main.async {
//                        self.data = decodedResponse
//                    }
//                    return
//                }
//            }
//
//            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        }.resume()
//    }
//}
//
//struct Post: Codable, Identifiable {
//    let id: Int
//    let title: String
//    let body: String
//}
//
//
//struct Sis_Previews: PreviewProvider {
//    static var previews: some View {
//        Sis()
//    }
//}
