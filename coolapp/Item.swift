//
//  Item.swift
//  coolapp
//
//  Created by sniper1239408 on 29/05/24.
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
