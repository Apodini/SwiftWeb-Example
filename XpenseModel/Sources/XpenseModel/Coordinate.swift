//
//  Coordinate.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

// MARK: Imports
import Foundation

// MARK: - Coordinate
/// Represents a single point on earth, specified by latitude and longitude.
public struct Coordinate {
    
    // MARK: Stored Instance Properties
    var latitude: Double
    var longitude: Double
    
    // MARK: Initializers
    public init(_ latitude: Double, _ longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}


// MARK: - Extension: Codable
extension Coordinate: Codable {}


// MARK: - Extension: Hashable
extension Coordinate: Hashable {}
