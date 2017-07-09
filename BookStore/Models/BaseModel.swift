//
//  BaseModel.swift
//  BookStore
//
//  Created by M Usman Saeed on 08/07/2017.
//  Copyright © 2017 MUS. All rights reserved.
//

import Foundation
import CoreData

public class BaseModel : NSManagedObject {
    
    static var entityName: String {
        return "\(self)"
    }
    
}


