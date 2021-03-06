//
//  Trips.swift
//  Flights
//
//  Created by Kyle Yoon on 2/14/16.
//  Copyright © 2016 Kyle Yoon. All rights reserved.
//

import Foundation

public struct Trips {
    
    public let kind: String
    public let requestID: String
    public let data: TripsData
    public let tripOptions: [TripOption]
    
    init(kind: String,
         requestID: String,
         data: TripsData,
         tripOptions: [TripOption]) {
        self.kind = kind
        self.requestID = requestID
        self.data = data
        self.tripOptions = tripOptions
    }
    
    static func decode(jsonDict: [String: AnyObject]) -> Trips? {
        if let kind = jsonDict["kind"] as? String,
            requestID = jsonDict["requestId"] as? String,
            data = jsonDict["data"] as? [String: AnyObject],
            tripOptions = jsonDict ["tripOption"] as? [[String: AnyObject]] {
            var decodedTripOptions = [TripOption]()
            for option in tripOptions {
                if let decodedOption = TripOption.decode(option) {
                    decodedTripOptions.append(decodedOption)
                }
            }
            
            if let data = TripsData.decode(data) {
                return Trips(kind: kind,
                             requestID: requestID,
                             data: data,
                             tripOptions: decodedTripOptions)
            }
        }
        
        return nil
    }
    
}

extension Trips: Equatable {}

public func ==(lhs: Trips, rhs: Trips) -> Bool {
    return lhs.kind == rhs.kind &&
        lhs.requestID == rhs.requestID &&
        lhs.data == rhs.data &&
        lhs.tripOptions == rhs.tripOptions
}