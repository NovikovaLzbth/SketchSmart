//
//  Card.swift
//  SketchSmart
//
//  Created by Елизавета on 24.12.2025.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let color: Color
    var isFaceUp = false
    var isMatched = false
}
