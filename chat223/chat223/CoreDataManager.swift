//////
//////  DateController.swift
//////  chat223
//////
//////  Created by abdiqani on 02/08/23.
//////
////
////import Foundation
////import CoreData
////
////class DateControoler: ObservableObject {
////    let container = NSPersistentContainer(name: "")
////
////    init(_ context: NSManagedObjectContext) {
////        container.loadPersistentStores { desc, error in
////            if let error = error {
////                print("failed to load \(error.localizedDescription)")
////            }
////
////        }
////    }
////    func saveContext(_ context: NSManagedObjectContext) {
////        do {
////            try context.save()
////            print("date saved")
////        } catch {
////            print("we could not save the date")
////        }
////    }
////    lazy var persistentContainer: NSPersistentContainer = {
////        let container = NSPersistentContainer(name: "YourDataModelName")
////        container.loadPersistentStores { (_, error) in
////            if let error = error as NSError? {
////                fatalError("Unresolved error \(error), \(error.userInfo)")
////            }
////        }
////        return container
////    }()
////
////    lazy var managedObjectContext: NSManagedObjectContext = {
////        return persistentContainer.viewContext
////    }()
////    func saveMessage(reseiver: String, sent: String) {
////        let message = Messages(context: managedObjectContext)
////        message.saveMessage(reseiver: String, sent: String) = text
////        message.sent = sent
////        message.timestamp = Date()
////        message.date = Date()
////
////        do {
////            try managedObjectContext.save()
////        } catch {
////            print("Failed to save message: \(error)")
////        }
////    }
////    func updateMessage(message: Message, newText: String) {
////        message.text = newText
////
////        do {
////            try managedObjectContext.save()
////        } catch {
////            print("Failed to update message: \(error)")
////        }
////    }
////
////    func deleteMessage(message: Message) {
////        managedObjectContext.delete(message)
////
////        do {
////            try managedObjectContext.save()
////        } catch {
////            print("Failed to delete message: \(error)")
////        }
////    }
////    func fetchMessages() -> [Messages] {
////        let fetchRequest: NSFetchRequest<Messages> = Messages.fetchRequest()
////        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: true)]
////
////        do {
////            let messages = try managedObjectContext.fetch(fetchRequest)
////            return messages
////        } catch {
////            print("Failed to fetch messages: \(error)")
////            return []
////        }
////    }
////}
//import Foundation
//import CoreData
//
//class CoreDataManager {
//    static let shared = CoreDataManager()
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "ChatAppModel")
//        let storeURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("ChatAppModel.sqlite")
//        let description = NSPersistentStoreDescription(url: storeURL)
//        description.type = NSSQLiteStoreType
//        container.persistentStoreDescriptions = [description]
//
//        container.loadPersistentStores { (_, error) in
//            if let error = error {
//                fatalError("Failed to load Core Data stack: \(error)")
//            }
//        }
//        return container
//    }()
//
//    var viewContext: NSManagedObjectContext {
//        return persistentContainer.viewContext
//    }
//    func saveContext() {
//            let context = persistentContainer.viewContext
//            if context.hasChanges {
//                do {
//                    try context.save()
//                } catch {
//                    let nserror = error as NSError
//                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//                }
//            }
//        }
//
////    func saveMessage(sender: String, content: String, timestamp: Date, isSender: Bool) {
////        let context = persistentContainer.viewContext
////        context.perform {
////            let message = Message(context: context)
////            message.sender = sender
////            message.content = content
////            message.timestamp = timestamp
////            message.isSender = isSender
////
////            do {
////                try context.save()
////            } catch {
////                print("Failed to save message: \(error)")
////            }
////        }
////    }
//    func saveMessages(forChat chat: Chat) {
//            let context = persistentContainer.viewContext
//            for message in chat.messages {
//                let entity = NSEntityDescription.entity(forEntityName: "Message", in: context)!
//                let messageObject = NSManagedObject(entity: entity, insertInto: context)
//                messageObject.setValue(message.id.uuidString, forKey: "id")
//                messageObject.setValue(message.text, forKey: "text")
//                messageObject.setValue(message.type.rawValue, forKey: "type")
//                messageObject.setValue(message.date, forKey: "date")
//                // Assuming you have already saved the 'Person' object for this chat
//                messageObject.setValue(chat.person.id.uuidString, forKey: "person_id")
//            }
//            saveContext()
//        }
//    func fetchMessages(forChat chat: Chat) -> [Message] {
//            let context = persistentContainer.viewContext
//            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
//            let predicate = NSPredicate(format: "person_id == %@", chat.person.id.uuidString)
//            fetchRequest.predicate = predicate
//
//            do {
//                let result = try context.fetch(fetchRequest)
//                var messages: [Message] = []
//                for data in result as! [NSManagedObject] {
//                    let id = UUID(uuidString: data.value(forKey: "id") as! String)!
//                    let text = data.value(forKey: "text") as! String
//                    let typeRawValue = data.value(forKey: "type") as! Int16
//                    let type = Message.MessageType(rawValue: typeRawValue) ?? .Sent
//                    let date = data.value(forKey: "date") as! Date
//                    let message = Message(id: id, text: text, type: type, date: date)
//                    messages.append(message)
//                }
//                return messages
//            } catch {
//                print("Failed to fetch messages: \(error)")
//                return []
//            }
//        }
////    func fetchMessages() -> [Message] {
////        let context = persistentContainer.viewContext
////        let fetchRequest: NSFetchRequest<Message> = Message.fetchRequest()
////        let sortDescriptor = NSSortDescriptor(key: "timestamp", ascending: true)
////        fetchRequest.sortDescriptors = [sortDescriptor]
////
////        do {
////            let messages = try context.fetch(fetchRequest)
////            return messages
////        } catch {
////            print("Failed to fetch messages: \(error)")
////            return []
////        }
////    }
//}
