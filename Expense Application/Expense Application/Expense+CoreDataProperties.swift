//
//  Expense+CoreDataProperties.swift
//  Expense Application
//
//  Created by Mitul Sarvaiya on 22/03/20.
//  Copyright © 2020 Mitul Sarvaiya. All rights reserved.
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var addedDate: NSDate?

}
