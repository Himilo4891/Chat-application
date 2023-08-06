//
//  MessageType+CoreDataProperties.swift
//  chat223
//
//  Created by abdiqani on 02/08/23.
//
//

import Foundation
import CoreData


extension MessageType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MessageType> {
        return NSFetchRequest<MessageType>(entityName: "MessageType")
    }

    @NSManaged public var sent: String?
    @NSManaged public var reveived: String?

}

extension MessageType : Identifiable {

}
