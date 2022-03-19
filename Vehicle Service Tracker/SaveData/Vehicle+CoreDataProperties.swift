//
//  Vehicle+CoreDataProperties.swift
//  savingData for Vehicle Service Tracker
//
//  Created by Alan Crisologo on 2/12/22.
//
//

import Foundation
import CoreData


extension Vehicle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vehicle> {
        return NSFetchRequest<Vehicle>(entityName: "Vehicle")
    }

    @NSManaged public var makeModel: String?
    //@NSManaged public var year: Int16
    @NSManaged public var year: String?
    @NSManaged public var purchaseDate: String?
    //@NSManaged public var totalMiles: Int16
    @NSManaged public var totalMiles: String?
    @NSManaged public var lastServiceDate: String?

}

extension Vehicle : Identifiable {

}
