//
//  TripsDataCity.swift
//  Flights
//
//  Created by Kyle Yoon on 3/5/16.
//  Copyright © 2016 Kyle Yoon. All rights reserved.
//

import Foundation

public struct TripsDataCity {
    
    public let kind: String?
    public let code: String?
    public let name: String?
    
    init(kind: String, code: String, name: String) {
        self.kind = kind
        self.code = code
        self.name = name
    }
    
    static func decode(jsonDict: [String: AnyObject]) -> TripsDataCity? {
        if let kind = jsonDict["kind"] as? String,
            code = jsonDict["code"] as? String,
            name = jsonDict["name"] as? String {
                return TripsDataCity(kind: kind,
                    code: code,
                    name: name)
        }
        
        return nil
    }
    
}

extension TripsDataCity: Equatable {}

public func ==(lhs: TripsDataCity, rhs: TripsDataCity) -> Bool {
    return lhs.kind == rhs.kind &&
        lhs.code == rhs.code &&
        lhs.name == rhs.name
}