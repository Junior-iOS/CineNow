//
//  View+Image.swift
//  Flix
//
//  Created by NJ Development on 23/01/26.
//

import Foundation
import SwiftUI

public enum Icon: String {
    case house = "house"
    case playHouseFill = "play.house.fill"
    case calendar = "calendar"
    case calendarBadgeCheckmark = "calendar.badge.checkmark"
    case popcorn = "popcorn"
    case popcornCircle = "popcorn.circle"
    case gear = "gear"
    case gearBadgeCheckmark = "gear.badge.checkmark"
}

public extension Image {
    init(icon: Icon) {
        self = Image(systemName: icon.rawValue)
    }
}
