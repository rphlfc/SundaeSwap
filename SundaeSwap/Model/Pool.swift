//
//  Pool.swift
//  SundaeSwap
//
//  Created by Raphael Cerqueira on 27/01/22.
//

import Foundation
import SwiftUI

struct Pool: Identifiable {
    let id = UUID().uuidString;
    let token1: Token
    let token2: Token
    let lpFee: Float
    let farmingAvailable: Bool
    let price: Float
    let totalLockedToken1: Float
    let totalLockedToken2: Float
    let volume24h = "---"
    var isExpanded = false
    var depth: Int = 0
}

var samplePools = [
    Pool(token1: Token(image: "sundae", name: "SUNDAE"), token2: ada, lpFee: 0.3, farmingAvailable: true, price: 0.727932, totalLockedToken1: 15516843.09, totalLockedToken2: 11295218.03, depth: 5000),
    Pool(token1: Token(image: "lq", name: "LQ"), token2: ada, lpFee: 0.3, farmingAvailable: true, price: 70.182383, totalLockedToken1: 98607.68, totalLockedToken2: 6920522.49, depth: 300),
    Pool(token1: Token(image: "wmt", name: "WMT"), token2: ada, lpFee: 0.3, farmingAvailable: true, price: 0.614692, totalLockedToken1: 5567002.29, totalLockedToken2: 3422334.71, depth: 70),
    Pool(token1: Token(image: "adax", name: "ADAX"), token2: ada, lpFee: 0.3, farmingAvailable: false, price: 0.800492, totalLockedToken1: 1602745, totalLockedToken2: 1282984.82, depth: 4),
    Pool(token1: Token(image: "pavia", name: "PAVIA"), token2: ada, lpFee: 0.3, farmingAvailable: false, price: 0.121877, totalLockedToken1: 9947097, totalLockedToken2: 1212324.35),
    Pool(token1: Token(image: "xray", name: "XRAY"), token2: ada, lpFee: 0.3, farmingAvailable: false, price: 0.121877, totalLockedToken1: 9947097, totalLockedToken2: 1212324.35),
    Pool(token1: Token(image: "sundae", name: "SUNDAE"), token2: ada, lpFee: 0.3, farmingAvailable: true, price: 0.727932, totalLockedToken1: 15516843.09, totalLockedToken2: 11295218.03),
    Pool(token1: Token(image: "lq", name: "LQ"), token2: ada, lpFee: 0.3, farmingAvailable: true, price: 70.182383, totalLockedToken1: 98607.68, totalLockedToken2: 6920522.49),
    Pool(token1: Token(image: "wmt", name: "WMT"), token2: ada, lpFee: 0.3, farmingAvailable: true, price: 0.614692, totalLockedToken1: 5567002.29, totalLockedToken2: 3422334.71),
    Pool(token1: Token(image: "adax", name: "ADAX"), token2: ada, lpFee: 0.3, farmingAvailable: false, price: 0.800492, totalLockedToken1: 1602745, totalLockedToken2: 1282984.82),
    Pool(token1: Token(image: "pavia", name: "PAVIA"), token2: ada, lpFee: 0.3, farmingAvailable: false, price: 0.121877, totalLockedToken1: 9947097, totalLockedToken2: 1212324.35),
    Pool(token1: Token(image: "xray", name: "XRAY"), token2: ada, lpFee: 0.3, farmingAvailable: false, price: 0.121877, totalLockedToken1: 9947097, totalLockedToken2: 1212324.35)
]
