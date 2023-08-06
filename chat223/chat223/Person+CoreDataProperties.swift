//
//  Person+CoreDataProperties.swift
//  chat223
//
//  Created by abdiqani on 02/08/23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imgString: String?
    @NSManaged public var name: String?

}

extension Person : Identifiable {

}
