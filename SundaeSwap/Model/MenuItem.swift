//
//  MenuItem.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import Foundation

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let title: String
}

let menuItems = [
    MenuItem(image: "house.fill", title: "Home"),
    MenuItem(image: "arrow.left.arrow.right", title: "Swap"),
    MenuItem(image: "drop.fill", title: "Liquidity"),
    MenuItem(image: "flag.fill", title: "Queue")
]
