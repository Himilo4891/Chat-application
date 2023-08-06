//
//  XMPPManager.swift
//  chat223
//
//  Created by abdiqani on 29/07/23.
//

import Foundation
// XMPPManager.swift

import XMPPFramework

class XMPPManager: NSObject {
    static let shared = XMPPManager()
    
    private var completion: ((Bool) -> Void)?
    private var xmppStream: XMPPStream!
    private var messageStorage: XMPPMessageArchivingCoreDataStorage!
    private var messageArchiving: XMPPMessageArchiving!
    private var userToken: String?

    private override init() {
        super.init()
        setupXMPPStream()
        setupMessageArchiving()
    }
    
    private func setupXMPPStream() {
        xmppStream = XMPPStream()
        xmppStream.addDelegate(self, delegateQueue: DispatchQueue.main)
        // Setup XMPPStream configuration here, such as host, port, etc.
        let serverJID = XMPPJID(user: "", domain: "uatchat2.waafi.com", resource: "chat223")
               xmppStream?.myJID = serverJID
               
               // Configure delegate
               xmppStream?.addDelegate(self, delegateQueue: DispatchQueue.main)
               
               // Add necessary extensions, such as roster
               // For example, if you need roster functionality:
               let rosterStorage = XMPPRosterCoreDataStorage()
               let roster = XMPPRoster(rosterStorage: rosterStorage)
               roster.activate(xmppStream)
               roster.addDelegate(self, delegateQueue: DispatchQueue.main)
           
    }
     
//    func saveMessageToCoreData(sender: String, receiver: String, content: String, date: Date) {
//            let managedObjectContext = PersistenceController.shared.container.viewContext
//
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//               let entity = NSEntityDescription.entity(forEntityName: "Message", in: context)!
//               let message = NSManagedObject(entity: entity, insertInto: context)
//        message.setValue(UUID().uuidString, forKey: "id")
//                message.setValue(sender, forKey: "sender")
//                message.setValue(receiver, forKey: "receiver")
//                message.setValue(date, forKey: "date")
//
//            do {
//                try managedObjectContext.save()
//            } catch {
//                print("Failed to save message to Core Data: \(error)")
//            }
//        }
    func xmppStream(_ sender: XMPPStream!, didReceive message: XMPPMessage!) {
        // Extract sender, text, and timestamp from the received message
        let sent = String()
        let recieved = String()
        let date = Date()
        
        // Save the message to Core Data
//        XMPPManager.shared.saveMessageToCoreData(sender: String(), receiver: String(), content: String(), date: Date())
    }
    
    private func setupMessageArchiving() {
        messageStorage = XMPPMessageArchivingCoreDataStorage.sharedInstance()
        messageArchiving = XMPPMessageArchiving(messageArchivingStorage: messageStorage)
        messageArchiving.clientSideMessageArchivingOnly = true
        messageArchiving.activate(xmppStream)
        messageArchiving.addDelegate(self, delegateQueue: DispatchQueue.main)
    }
    
    func connect(withUserToken token: String) -> Bool {

        let jid = XMPPJID(user: token, domain: "uatchat2.waafi.com", resource: "iOS")
        xmppStream.myJID = jid

        do {
            try xmppStream.connect(withTimeout: XMPPStreamTimeoutNone)
        } catch {
            print("Failed to connect to XMPP server: \(error.localizedDescription)")
        }
        return xmppStream.isConnected
    }
    
    func authenticateUsers(UserToken: String) {
        
        let UserToken: [(String, String)] = [
                ("252610772210", "D2vRG//GF9Kov3O6/DIPw+b5U5sw2+9OtrTo/j61+Ute9VF/xvvKY3F8/DPbuWmCo3vdo/hw8duNuASyjiYowg=="),
                ("252610777621", "TbXKNyUjhcokXxfTSmE3LDrevRQB+8N6U+MxGUJdZ+89uNvcszUIazwvB/NPokY+NyhyWTLb9NgIJploHcpSCw=="),
                ("252610777622", "REte9eAj7CSsYFUjmBJtfhzrmCreikfW8+RLGFgaSyurifWMZpZrKpE5LQBZRsKKDOrRCBCQEjs5MjUcslN4oQ=="),
                ("252610777627", "10ZOdZFTkYeUQc0760iMUKVCl4YyQ/DT3oqWO9KRPYbbRavAxXqsPQIAKB7FGlbfzsgWvib6jJEUcuRy6DEpjw=="),
                ("252610777628", "reo/bMBYu4c3EomGqoBdaRUHJCvPcIYuRpdYei5EyL56FZ4oIPMtkk+lfO7FgXCUX9sUtY1O4qeQw4HN8sHd5w=="),
                ("252611000021", "z6E7CzyEGJhUxOfFXWIV3bTbzNUAvQZV1LPPFxQp3iytgdS0HwmORuofZbrF16cEMYDrGvR0XfC8Nt4c2QbAew=="),
                ("252611000030", "Br3rldyJBLiN474ynhQJxylXbzGu4XAAj8B7KbFs5EdFirXZnpYhfZCVHThGDDEm+XOOFREP92topYaaNLEwFA=="),
                ("252611000055", "1d/nJYSoxz00xAaLXgi7to95JFWanCZm/+ecdCmMxwRxZnZuhF66Phpc+OItpPfqdcvLap7q/HBBdty74F5Y8Q=="),
                ("252611000096", "jPiTI/HZanhOSygCWiZrQSyJdAlhgIWq1y7YY3ZPk9jC5TprRc5+1A6n99tsiZf0Ng7IlWcyHMw4arbs4DlOiA=="),
                ("252611000105", "aFio16zXuWIZMARZ7PXb4hbuxW7I5vXViIVq7Wrxj2TSL5W4mCmUQhr4wUuNgIut/+jTpunKZCUZFb1lMecc0A=="),
                ("252611000119", "fRo3xFWIWA9fYxnU4ESM+fi3TbkSAazYSMYlHVu2wNgZol8Pq34jn2liBeNJ5ydfZyJYcDFjrHp3BbUVAG4kVA=="),
                ("252611000192", "jpb0+ERwZX7ZFMvAuP5clHPbEAkk0a43i7th+ANtc90GHcIOrieq/R0Jddzp8SQswrLNaIeBdmS5KirgnxYLjg=="),
                ("252611000205", "C59uJ0TQAJ7roOI8LSU1Tbmext+dTx6H2qlNuHlUt6zoQE6mNoS6mTvYLRuUloZoRk91Bv7k4Zz0Tm8e1Fn2hQ=="),
                ("252611000209", "HqMpePiGomW/c0VkMMpnG6l8COAq6shBHEAweDDcl7qfym5X9O9SUvmXAaFLsPaKQCU6TIR+0/NHyjfdurAf1A=="),
                ("252611000290", "QyJSRZGfX06e3Nraz9mKWdj0cQo+qOd0kCZgvocNE0gwvHK5LU3w3Svzo+Q8yGe2v6FLMienE/LCjpDz6rN53g=="),
                ("252611000303", "OCOAdvJBd2+8sVncSAB/g77gSTbw0nCQMOVHlhhxc99jjxVEH0+hdywdntZ2Kuh91ZqE6sBfdVLS88M5eH8CNQ=="),
                ("252611000315", "aOCjwIU77UR0en7J/vrwh0Dm6d3fH3C80/5ut/P5zpMfQyC+qw3I+bTQvypsHgWiZNlE1EpJ1XV1dra9DqhQhQ=="),
                ("252611000365", "NDWumGjZELQB+lU0SCW3bSrde5I8Mi+fmSU1awR2+C9Sf/Va3mq+yK1jkUsYurBkJQ8xFYeRHxFmsSqdE18jMg=="),
                ("252611000370", "A1IZ32dPNbD79SCcPAAyBev4bHLAxSCSeuig7eGYADqpBI0fDj3bMPWhKyjYyYhDr0pAoz4gD57oB7/OAp7mIg=="),
                ("252611000381", "WJIudIqGuWWiCXaR0uAc+NsjByh42cgg0WNwE6J8DaLRU/sjhmFMtqX0yXKqoAckPZsZUNlneylx219hp8wAtw==")
            ]

        for (userToken, password) in UserToken {
            let jid = "\(UserToken)@uatchat2.waafi.com"
            connectXMPPServer(withJID: jid, password: password)
       
        }
    }
    func connectXMPPServer(withJID jid: String, password: String) {
        if !xmppStream.isConnected {
            xmppStream.myJID = XMPPJID(string: jid)
            xmppStream.hostName = "uatchat2.waafi.com"
            xmppStream.hostPort = 5222
//            xmppStream.UserToken = UserToken
            
            do {
                try xmppStream.connect(withTimeout: XMPPStreamTimeoutNone)
            } catch {
                print("Error connecting to XMPP server.")
            }
        }
    }
    
}

extension XMPPManager: XMPPStreamDelegate {
    // Implement delegate methods for handling XMPP connection events
    func xmppStreamDidConnect(_ sender: XMPPStream) {
        print("XMPP connected")
        
        // Perform login once the stream is connected
        do {
            try xmppStream.authenticate(withPassword: String()) // Assuming no password is required for authentication
        } catch {
            print("Failed to authenticate with XMPP server: \(error.localizedDescription)")
            completion?(false)
        }
    }
    
    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        print("XMPP authenticated")
        completion?(true)
        // Handle successful login here
        // You may consider sending a presence message to show that the user is online
    }
    
    func xmppStream(_ sender: XMPPStream, didNotAuthenticate error: DDXMLElement) {
        print("XMPP authentication failed")
        completion?(false)
    
    }
    
}
extension XMPPManager {
    func login(with userToken: String, completion: @escaping (Bool) -> Void) {
        self.completion = completion
        guard let stream = xmppStream else {
            completion(false)
            return
        }
        
        let jid = XMPPJID(user: "user_id", domain: "uatchat2.waafi.com", resource: "chat233")
                stream.myJID = jid
//                stream.password = userToken
        
        // Connect to the server and authenticate
        do {
            try stream.connect(withTimeout: XMPPStreamTimeoutNone)
        } catch {
            print("Error connecting to the server: \(error)")
            completion(false)
            return
        }
        
        
    }
}
