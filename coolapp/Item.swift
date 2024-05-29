//
//  Item.swift
//  coolapp
//
//  Created by Ahaan Jain on 29/05/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}