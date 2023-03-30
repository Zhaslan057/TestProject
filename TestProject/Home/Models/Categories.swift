//
//  Categories.swift
//  TestProject
//
//  Created by Жаслан Танербергенов on 29.03.2023.
//

import SwiftUI

struct Category : Identifiable {
    var id = UUID()
    var icon : String
    var text : String
}
var categories = [
    Category(icon: "iphone", text: "Phones"),
    Category(icon: "headphones", text: "Headphones"),
    Category(icon: "gamecontroller", text: "Games"),
    Category(icon: "car", text: "Cars"),
    Category(icon: "bed.double", text: "Furniture"),
    Category(icon: "figure.2.and.child.holdinghands", text: "Kids")
]

