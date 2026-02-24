//
//  User.swift
//  SwiftUI2Weeks
//
//  Created by Pooja Chaudhari on 07/02/26.
//

import SwiftUI

struct User: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let isLoggedIn: Bool
    let isPremium: Bool
}
