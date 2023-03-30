//
//  TabItems.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 21.03.2023.
//

//import SwiftUI
//
//struct TabItem : Identifiable {
//    var id = UUID()
//    var icon : String
//    var tab: Tab
//    var color : Color
//}
//var tabItems = [
//    TabItem(icon: "house", tab: .home, color: .teal),
//    TabItem(icon: "heart", tab: .favorite, color: .blue),
//    TabItem(icon: "cart", tab: .cart, color: .red),
//    TabItem(icon: "bubble.left", tab : .messages, color: .pink),
////    TabItem(icon: "person", tab : .profile, color: .green)
//
//]
//enum Tab: String {
//    case home
//    case favorite
//    case cart
//    case messages
////    case profile
//}
//struct TabPreferenceKey : PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = nextValue()
//    }
//}


import SwiftUI

struct TabItem : Identifiable {
    var id = UUID()
    var index : Int
    var icon : String
    var tab: Tab
}
var tabItems = [
    TabItem(index: 1, icon: "house", tab: .home),
    TabItem(index: 2, icon: "heart", tab: .favorite),
    TabItem(index: 3, icon: "cart", tab : .cart),
    TabItem(index: 4, icon: "bubble.left", tab: .messages),
    TabItem(index: 5, icon: "person", tab : .profile)
]
enum Tab: String {
    case home
    case favorite
    case cart
    case messages
    case profile
}
struct TabPreferenceKey : PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
