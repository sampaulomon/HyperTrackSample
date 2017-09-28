//
//  TrackingStatus.swift
//  HyperTrackSample
//
//  Created by Sam Paul on 19/09/17.
//  Copyright © 2017 Turvo. All rights reserved.
//

import UIKit

enum TrackingStatus: CustomStringConvertible {
    case tracking
    case notTracking
    
    var description: String {
        switch self {
        case .tracking:
            return "STOP TRACKING"
        case .notTracking:
            return "START TRACKING"
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .tracking:
            return UIColor.black
        case .notTracking:
            return UIColor.white
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .tracking:
            return UIColor.white
        case .notTracking:
            return UIColor.black
        }
    }
    
    mutating func toggle() {
        switch self {
        case .tracking:
            self = .notTracking
        case .notTracking:
            self = .tracking
        }
    }
}

