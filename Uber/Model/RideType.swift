//
//  RideType.swift
//  Uber
//
//  Created by Omkar Anarse on 23/01/24.
//

import Foundation

enum RideType : Int, Identifiable, CaseIterable {
    case uberX
    case black
    case uberXL
    
    var id : Int { return rawValue }
    
    var discription : String {
        switch self {
        case .uberX:
            return "Uber-X"
        case .black:
            return "Uber-Black"
        case .uberXL:
            return "Uber-XL"
        }
    }
    
    var imageName : String {
        switch self {
        case .uberX:
            return "uber-x"
        case .black:
            return "uber-black"
        case .uberXL:
            return "uber-x"
        }
    }
    
    var baseFare : Double {
        switch self {
        case .uberX:
            return 5
        case .black:
            return 20
        case .uberXL:
            return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .uberX:
            return distanceInMiles * 1.5 + baseFare
        case .black:
            return distanceInMiles * 2.0 + baseFare
        case .uberXL:
            return distanceInMiles * 1.75 + baseFare
        }
    }
}
