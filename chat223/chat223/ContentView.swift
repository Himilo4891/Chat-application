//
//  ContentView.swift
//  chat223
//
//  Created by abdiqani on 24/07/23.
//

import SwiftUI
import CoreData
import XMPPFramework
struct LoginScreen: View {
    @State private var userToken: String = ""
    @State private var showAlert: Bool = false
    @State private var errorMessage: String = ""
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack {
                    TextField("Enter User token", text: $userToken)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
//                        .disabled(isLoggingIn)

                    Button("Login") {
                        authenticateUser()
//                            XMPPManager.shared.authenticateUsers(UserToken: String())
                        }
                        .padding()
                        .bold()
                        .frame(width: 300, height:  40)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
//                        .disabled(isLoggingIn)
                    NavigationLink(destination: ContentView(), label: {

                    })
                }
                .navigationBarTitle("Login")
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                    
                }
                EmptyView()
                    .padding()
            }
        }
//                .padding()
//                .disabled(isLoggingIn)
        
    }
    private func authenticateUser() {
        let trimmedToken = userToken.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedToken.isEmpty else {
            errorMessage = "Please enter a valid token."
            showAlert = true
            return
        }
        
        if userPasswords[trimmedToken] != nil {
            let jid = XMPPJID(user: trimmedToken, domain: "uatchat2.waafi.com", resource: "ChatApp")
            let xmppStream = XMPPStream()
            xmppStream.myJID = jid
            let hostName = "uatchat2.waafi.com"
            let hostPort: UInt16 = 5222
            
            let contentView = ContentView()
            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: contentView)
        } else {
            showAlert = false
        }
    }
    
}
    
    
    // Example data
    let userPasswords: [String: String] = [
        "252610772210": "D2vRG//GF9Kov3O6/DIPw+b5U5sw2+9OtrTo/j61+Ute9VF/xvvKY3F8/DPbuWmCo3vdo/hw8duNuASyjiYowg==",
        "252610777621": "TbXKNyUjhcokXxfTSmE3LDrevRQB+8N6U+MxGUJdZ+89uNvcszUIazwvB/NPokY+NyhyWTLb9NgIJploHcpSCw==",
        "252610777622": "REte9eAj7CSsYFUjmBJtfhzrmCreikfW8+RLGFgaSyurifWMZpZrKpE5LQBZRsKKDOrRCBCQEjs5MjUcslN4oQ==",
        "252610777627": "10ZOdZFTkYeUQc0760iMUKVCl4YyQ/DT3oqWO9KRPYbbRavAxXqsPQIAKB7FGlbfzsgWvib6jJEUcuRy6DEpjw==",
        "252610777628": "reo/bMBYu4c3EomGqoBdaRUHJCvPcIYuRpdYei5EyL56FZ4oIPMtkk+lfO7FgXCUX9sUtY1O4qeQw4HN8sHd5w==",
        "252611000021": "z6E7CzyEGJhUxOfFXWIV3bTbzNUAvQZV1LPPFxQp3iytgdS0HwmORuofZbrF16cEMYDrGvR0XfC8Nt4c2QbAew==",
        "252611000030": "Br3rldyJBLiN474ynhQJxylXbzGu4XAAj8B7KbFs5EdFirXZnpYhfZCVHThGDDEm+XOOFREP92topYaaNLEwFA==",
        "252611000055": "1d/nJYSoxz00xAaLXgi7to95JFWanCZm/+ecdCmMxwRxZnZuhF66Phpc+OItpPfqdcvLap7q/HBBdty74F5Y8Q==",
        "252611000096": "jPiTI/HZanhOSygCWiZrQSyJdAlhgIWq1y7YY3ZPk9jC5TprRc5+1A6n99tsiZf0Ng7IlWcyHMw4arbs4DlOiA==",
        "252611000105": "aFio16zXuWIZMARZ7PXb4hbuxW7I5vXViIVq7Wrxj2TSL5W4mCmUQhr4wUuNgIut/+jTpunKZCUZFb1lMecc0A==",
        "252611000119": "fRo3xFWIWA9fYxnU4ESM+fi3TbkSAazYSMYlHVu2wNgZol8Pq34jn2liBeNJ5ydfZyJYcDFjrHp3BbUVAG4kVA==",
        "252611000192": "jpb0+ERwZX7ZFMvAuP5clHPbEAkk0a43i7th+ANtc90GHcIOrieq/R0Jddzp8SQswrLNaIeBdmS5KirgnxYLjg==",
        "252611000205": "C59uJ0TQAJ7roOI8LSU1Tbmext+dTx6H2qlNuHlUt6zoQE6mNoS6mTvYLRuUloZoRk91Bv7k4Zz0Tm8e1Fn2hQ==",
        "252611000209": "HqMpePiGomW/c0VkMMpnG6l8COAq6shBHEAweDDcl7qfym5X9O9SUvmXAaFLsPaKQCU6TIR+0/NHyjfdurAf1A==",
        "252611000290": "QyJSRZGfX06e3Nraz9mKWdj0cQo+qOd0kCZgvocNE0gwvHK5LU3w3Svzo+Q8yGe2v6FLMienE/LCjpDz6rN53g==",
        "252611000303": "OCOAdvJBd2+8sVncSAB/g77gSTbw0nCQMOVHlhhxc99jjxVEH0+hdywdntZ2Kuh91ZqE6sBfdVLS88M5eH8CNQ==",
        "252611000315": "aOCjwIU77UR0en7J/vrwh0Dm6d3fH3C80/5ut/P5zpMfQyC+qw3I+bTQvypsHgWiZNlE1EpJ1XV1dra9DqhQhQ==",
        "252611000365": "NDWumGjZELQB+lU0SCW3bSrde5I8Mi+fmSU1awR2+C9Sf/Va3mq+yK1jkUsYurBkJQ8xFYeRHxFmsSqdE18jMg==",
        "252611000370": "A1IZ32dPNbD79SCcPAAyBev4bHLAxSCSeuig7eGYADqpBI0fDj3bMPWhKyjYyYhDr0pAoz4gD57oB7/OAp7mIg==",
        "252611000381": "WJIudIqGuWWiCXaR0uAc+NsjByh42cgg0WNwE6J8DaLRU/sjhmFMtqX0yXKqoAckPZsZUNlneylx219hp8wAtw=="
    ]


struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: Message.entity(), sortDescriptors: [NSSortDescriptor(key: "timestamp", ascending: true)]) var messages: FetchedResults<Message>

    let chat = Chat.sampleChat
    let persistenceController = PersistenceController.shared

    @StateObject var viewModel = ChatViewModel()
    @State private var query = ""
    
    var body: some View {
        NavigationView{
            List {
                        // Display the content of the message
//                        Text(message.content ?? "")
                ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                    
                    ZStack{
                        
                        ChatList(chat: chat)
                        
                        NavigationLink(destination: {
//                            Text(chat.person.name)
                            
                            ChatView(chat: chat)
                                .environmentObject(viewModel)
                            
                        }) {
                            EmptyView()
                        }
                        
                        
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        }) {
                            if chat.hasUnreadMessage {
                                Label("Read", systemImage: "text.bubble")
                            } else {
                                Label("Unread", systemImage: "circle.file")
                            }
                        }
                        .tint(.blue)
                    }
                }
        }
    }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Chats")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName:  "square.and.pencil")
            })
            .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
    
    }

struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                LoginScreen()

            }
        }
    

