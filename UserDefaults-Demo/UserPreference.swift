//
//  UserPreference.swift
//  UserDefaults-Demo
//
//  Created by Juan Ceballos on 1/13/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

enum UnitMeasurement: String    {
    case miles = "Miles"
    case kilometers = "Kilometers"
}

struct UserPreferenceKey    {
    static let unitMeasurement = "Unit Measurement"
}

class UserPreference    {
    
    private init() {}
    
    // UserDefaults is a dictionary
    private let standard = UserDefaults.standard  // UserDefaults.standard.set = standard.set, singleton
    
    // only instance, use through shared property userPreference.shared
    static let shared = UserPreference()
    
    // set a user default value
    func updateUnitMeasurement(with unit: UnitMeasurement)    {
        // storing or persisting the unit measurement value to userDefault (device or simulator as permanent storage)
        standard.set(unit.rawValue, forKey: UserPreferenceKey.unitMeasurement)
        
        // key is "Unit Measurement"
        // value is either "Miles" or "Kilometers
        // UserDefaults[] -> UserDefaults ["Unit Measurement" : "Kilometers"]
    }
    
    //retrieve a user defaults value(object)
    func getUnitMeasurement()   -> UnitMeasurement? {
        guard let unitMeasurement = UserDefaults.standard.object(forKey: UserPreferenceKey.unitMeasurement) as? String
            else    {
                return nil
            }
        return UnitMeasurement(rawValue: unitMeasurement)
    }
}
