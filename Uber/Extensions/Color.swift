//
//  Color.swift
//  Uber
//
//  Created by Omkar Anarse on 25/01/24.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("primaryTextColor")
}
