//
//  HomeView.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 21.03.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @AppStorage("logStatus") var logStatus = true
    var city = ["Location", "Moscow", "Saint Petersburg", "Kazan"]
    @State private var selectedCity = "Location"
    @State private var searchField = ""
    var columns = [GridItem(.adaptive(minimum: 50))]
    var body: some View {
        VStack {
            HStack {
                Button {} label: {
                    Image(systemName: "line.3.horizontal")
                }
                Spacer()
                Group {
                    Text("Trade by ")
                    +
                    Text("Bata")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                .font(.custom("Montserrat", size: 22))
                Spacer()
                
                Button {} label: {
                    avatar
                        .accessibilityElement()
                        .accessibilityLabel("Profile")
                }
            }
            .padding(.horizontal, 15)
            HStack {
                Spacer()
                Picker("Location",selection: $selectedCity) {
                    ForEach(city, id: \.self) {
                        Text($0)
                    }
                }
            }
            .padding(.top, 7)
            
            HStack {
                TextField("What are you looking for?", text: $searchField)
                    .padding(.vertical ,6)
                    .padding(.leading, 16)
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 16)
            }
            .background(Capsule().fill(Color("TextfieldBack")))
            .frame(width: UIScreen.main.bounds.width/1.4)
            
            LazyVGrid(columns: columns) {
                ForEach(categories) { Category in
                    Button {} label: {
                        VStack {
                            Circle()
                                .frame(width: 50)
                                .foregroundColor(.gray).opacity(0.2)
                                .background(
                                    Image(systemName: Category.icon)
                                        .foregroundColor(.black)
                                )
                            Text(Category.text)
                                .font(.custom("Montserrat", size: 8))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding(.top, 23)
            .padding(.horizontal, 15)
            
            HStack {
                Text("Latest")
                    .font(.custom("Montserrat", size: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button("View all") {}
                    .font(.custom("Montserrat", size: 9))
            }
            .padding(.horizontal, 11)
            
            Text("kek")
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
    @ViewBuilder
    var avatar: some View {
        if logStatus {
            AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: .init(animation: .easeOut)) { phase in
                switch phase {
                case .empty:
                    Color.white
                case .success(let image):
                    image.resizable()
                case .failure(_):
                    Color.gray
                @unknown default:
                    Color.gray
                }
            }
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(4)
            .background(
                Circle()
                    .fill(.black))
            .transition(.scale.combined(with: .slide))
        } else {
            Image("Avatar Default")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
