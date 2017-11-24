//
//  User+CoreDataProperties.swift
//  iOSExamC0702741
//
//  Created by Deepesh Mehta on 2017-11-23.
//  Copyright © 2017 Deepesh Mehta. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int32
    @NSManaged public var major: String?
    @NSManaged public var name: String?
}
