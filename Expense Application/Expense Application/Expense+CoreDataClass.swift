//
//  Expense+CoreDataClass.swift
//  Expense Application
//
//  Created by Mitul Sarvaiya on 22/03/20.
//  Copyright © 2020 Mitul Sarvaiya. All rights reserved.
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {

    var date: Date?{
        get{
            return addedDate as Date?
        }
        set{
            addedDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, amount: Double, date:Date?){
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Expense.entity(), insertInto: managedContext)
        self.name = name
        self.amount = amount
        self.date = date
    }
    
    
    
    
}
