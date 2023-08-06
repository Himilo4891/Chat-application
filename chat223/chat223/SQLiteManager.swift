
import SQLite

// Define SQLite tables
struct ChatTable {
    static let table = Table("chats")
    static let id = Expression<Int>("id")
    static let personID = Expression<String>("personID")
   
}

struct PersonTable {
    static let table = Table("persons")
    static let id = Expression<String>("id")
}

struct MessageTable {
    static let table = Table("messages")
    static let id = Expression<Int>("id")
    static let chatID = Expression<Int>("chatID")
}

func insertSampleData() throws {
    
    // Open a SQLite database connection
    let db = try Connection("path_to_your_database_file")
    
    // Insert sample data
    for chat in Chat.sampleChat {
        // Insert Person
        let personInsert = PersonTable.table.insert(
            PersonTable.id <- chat.person.id.uuidString
        )
        let personID = try db.run(personInsert)
        
        // Insert Chat
        let chatInsert = ChatTable.table.insert(
            ChatTable.id <- chat.id.hashValue,
            ChatTable.personID <- chat.person.id.uuidString
        )
        let chatID = try db.run(chatInsert)
        
        // Insert Messages
        for message in chat.messages {
            let messageInsert = MessageTable.table.insert(
                MessageTable.id <- message.id.hashValue
                
            )
            try db.run(messageInsert)
        }
    }
}
func initializeDatabase() {
    do {
        try insertSampleData()
    } catch {
        // Handle error
        print("Error initializing database: \(error)")
    }
}
