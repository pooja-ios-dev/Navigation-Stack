//
//  Product.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//

import SwiftUI

struct Products: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
    let category: String
}
