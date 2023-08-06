//
//  ChatModel.swift
//  chat223
//
//  Created by abdiqani on 25/07/23.
//
import CoreData
import Foundation
struct Chat: Identifiable {
//    @EnvironmentObject var datecontroller: DateControoler

    var id: UUID { person.id}
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}

struct Message: Identifiable {
    enum MessageType {
        case Sent, Reveived
    }
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date){
        self.date = date
        self.type = type
        self.text = text
    }
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

extension Chat {
    static let sampleChat = [
        Chat (person: Person(name: "252610772210", imgString: "1"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("I am just developing an whatsApp", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 3)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date())
        ], hasUnreadMessage: true),
        
        Chat (person: Person(name: "252610777621", imgString: "2"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ],hasUnreadMessage: true),
        
        
      
        Chat (person: Person(name: "252610777622", imgString: "3"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ],hasUnreadMessage: true),
        Chat (person: Person(name: "252610777627", imgString: "4"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date())        ]),
        
        Chat (person: Person(name: "252610777628", imgString: "5"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        
        Chat (person: Person(name: "252611000021", imgString: "6"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ],hasUnreadMessage: true),
        Chat (person: Person(name: "252611000030", imgString: "7"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        Chat (person: Person(name: "252611000055", imgString: "8"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date())        ]),
        Chat (person: Person(name: "252611000096", imgString: "9"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        Chat (person: Person(name: "252611000105", imgString: "10"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        Chat (person: Person(name: "252611000119", imgString: "11"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("I am just developing an whatsApp", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 3)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date())
        ], hasUnreadMessage: true),
        
        Chat (person: Person(name: "252611000192", imgString: "12"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        
        
        Chat (person: Person(name: "252611000205", imgString: "13"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        Chat (person: Person(name: "252611000209", imgString: "14"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        Chat (person: Person(name: "252611000290", imgString: "15"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date())        ]),
        
        Chat (person: Person(name: "252611000303", imgString: "16"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        
        Chat (person: Person(name: "252611000315", imgString: "17"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        Chat (person: Person(name: "252611000365", imgString: "18"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        Chat (person: Person(name: "252611000370", imgString: "19"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date())        ]),
        Chat (person: Person(name: "252611000381", imgString: "20"), messages: [
            Message("hi xan",  type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 5)),
            Message("I am just developing an whatsApp", type: .Reveived, date: Date(timeIntervalSinceNow: -86400 * 3)),
            Message("please i need your helping", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("maybe you send me som?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("sure i can do that. no problem", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 2)),
            Message("what do you call a finsh with no eyes?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Sent,date:Date(timeIntervalSinceNow: -86400 * 1)),
            Message("sure how cN I Help you flo?", type: .Reveived,date:Date())        ]),
        
    ]
}
