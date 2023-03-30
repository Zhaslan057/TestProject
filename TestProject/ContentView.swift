//
//  ContentView.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 20.03.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var loginModel: LoginViewModel = .init()
    @AppStorage("logStatus") var logStatus = true
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    var body: some View {
        ZStack {
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .favorite:
                    Text("page favorites")
                case .cart:
                    Text("page cart")
                case .messages:
                    Text("page messages")
                case .profile:
                    Text("p")
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}.frame(height: 44)
            }
            
            TabBarView()
            
            if !logStatus {
//                LoginView()
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
