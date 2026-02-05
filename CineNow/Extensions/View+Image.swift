//
//  View+Image.swift
//  CineNow
//
//  Created by NJ Development on 04/02/26.
//

import Foundation
import SwiftUI

public enum Icon: String {
    case house
    case playHouseFill = "play.house.fill"
    case calendar
    case calendarBadgeCheckmark = "calendar.badge.checkmark"
    case popcorn
    case popcornCircle = "popcorn.circle"
    case gear
    case gearBadgeCheckmark = "gear.badge.checkmark"
}

public extension Image {
    init(icon: Icon) {
        self = Image(systemName: icon.rawValue)
    }
}
