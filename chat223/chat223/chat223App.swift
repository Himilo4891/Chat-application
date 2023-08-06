//
//  chat223App.swift
//  chat223
//
//  Created by abdiqani on 24/07/23.
//

import SwiftUI
import XMPPFramework

@main
struct chat223App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            LoginScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate, XMPPStreamDelegate {
    var xmppStream: XMPPStream!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupXMPP()
        return true
    }
    
    func setupXMPP() {
        xmppStream = XMPPStream()
        // Configure XMPP modules and set up stream
        // You might need to configure the XMPPRoster, XMPPMessageArchiving, etc.
        // based on your chat app requirements.
        
        xmppStream.addDelegate(self, delegateQueue: DispatchQueue.main)
        
        let xmppHost = "uatchat2.waafi.com"
        let xmppPort: UInt16 = 5222
        
        do {
            try xmppStream.connect(withTimeout: XMPPStreamTimeoutNone)
        } catch {
            print("Error connecting to XMPP server: \(error)")
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ChatAppModel") // Replace with your Core Data model name
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    lazy var managedObjectContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
