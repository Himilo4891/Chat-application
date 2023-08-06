//
//  Message+CoreDataClass.swift
//  chat223
//
//  Created by abdiqani on 02/08/23.
//
//

import Foundation
import CoreData

@objc(Message)
public class Message: NSManagedObject {

    convenience init(WithDictionary dict:NSDictionary){


            let appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate

            let managedContext = appDelegate.managedObjectContext

            let newEntity =  NSEntityDescription.entityForName("UserData", inManagedObjectContext:managedContext)

            // initializer on NSManagedObject class
            self.init(entity: newEntity!, insertIntoManagedObjectContext: managedContext)

            self.userId =  (dict.valueForKey(ID) != nil) && !(dict.valueForKey(ID) is NSNull)
                ? dict.valueForKey(ID) as! String
                : ""
        
        do {
            try managedContext.save()

        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
}
extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var type: String?

}

extension Message : Identifiable {

}
