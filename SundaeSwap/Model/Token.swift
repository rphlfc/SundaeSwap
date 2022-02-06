//
//  Token.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 29/01/22.
//

import Foundation

struct Token: Identifiable {
    let id = UUID().uuidString
    let image: String
    let name: String
}

let ada = Token(image: "ada", name: "ADA")

let tokens = [
    Token(image: "wmt", name: "WMT"),
    Token(image: "pavia", name: "PAVIA"),
    Token(image: "xray", name: "XRAY"),
    Token(image: "milk", name: "MILK"),
    Token(image: "mint", name: "MINt"),
    Token(image: "bison", name: "BISON"),
]
