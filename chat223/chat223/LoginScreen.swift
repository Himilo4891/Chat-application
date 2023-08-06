////
////  LoginScreen.swift
////  chat223
////
////  Created by abdiqani on 30/07/23.
////
//
//import SwiftUI
////import XMPPFramework
//import XMPPFrameworkSwift
//struct LoginScreen: View {
//    @State private var userToken: String = ""
//    @State private var isLoggingIn: Bool = false
//    @State private var showAlert = false
//    
//    var body: some View {
//        NavigationView {
////            ContentView()
//            ZStack {
//                Color.blue
//                    .ignoresSafeArea()
//                Circle()
//                    .scale(1.7)
//                    .foregroundColor(.white.opacity(0.15))
//                Circle()
//                    .scale(1.35)
//                    .foregroundColor(.white)
//                
//                VStack {
//                    TextField("Enter User token", text: $userToken)
//                        .padding()
//                    //                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .frame(width: 300, height: 50)
//                        .background(Color.black.opacity(0.05))
//                        .cornerRadius(10)
//                        .disabled(isLoggingIn)
//                    
//                    Button("Login", action: login)
////                    XMPPManager.shared.authenticateUser(withToken token: String)
//                        .padding()
//                        .bold()
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .cornerRadius(20)
//                        .disabled(isLoggingIn)
//                    NavigationLink(destination: Text("destination"), label: {
//                        Text("next screen")
//                    })
//                }
//                .navigationBarTitle("Login")
//                .alert(isPresented: $showAlert) {
//                    Alert(title: Text("Login Failed"), message: Text("Invalid user token"), dismissButton: .default(Text("OK")))
//                    
//                }
////                EmptyView()
//            }
//        }
//        //        .padding()
//        //        .disabled(isLoggingIn)
//        
//    }
//
//    private let UserToken: [String: String]  = [
//            "252610772210": "D2vRG//GF9Kov3O6/DIPw+b5U5sw2+9OtrTo/j61+Ute9VF/xvvKY3F8/DPbuWmCo3vdo/hw8duNuASyjiYowg==",
//            "252610777621": "TbXKNyUjhcokXxfTSmE3LDrevRQB+8N6U+MxGUJdZ+89uNvcszUIazwvB/NPokY+NyhyWTLb9NgIJploHcpSCw==",
//            "252610777622": "REte9eAj7CSsYFUjmBJtfhzrmCreikfW8+RLGFgaSyurifWMZpZrKpE5LQBZRsKKDOrRCBCQEjs5MjUcslN4oQ==",
//            "252610777627": "10ZOdZFTkYeUQc0760iMUKVCl4YyQ/DT3oqWO9KRPYbbRavAxXqsPQIAKB7FGlbfzsgWvib6jJEUcuRy6DEpjw==",
//            "252610777628": "reo/bMBYu4c3EomGqoBdaRUHJCvPcIYuRpdYei5EyL56FZ4oIPMtkk+lfO7FgXCUX9sUtY1O4qeQw4HN8sHd5w==",
//            "252611000021": "z6E7CzyEGJhUxOfFXWIV3bTbzNUAvQZV1LPPFxQp3iytgdS0HwmORuofZbrF16cEMYDrGvR0XfC8Nt4c2QbAew==",
//            "252611000030": "Br3rldyJBLiN474ynhQJxylXbzGu4XAAj8B7KbFs5EdFirXZnpYhfZCVHThGDDEm+XOOFREP92topYaaNLEwFA==",
//            "252611000055": "1d/nJYSoxz00xAaLXgi7to95JFWanCZm/+ecdCmMxwRxZnZuhF66Phpc+OItpPfqdcvLap7q/HBBdty74F5Y8Q==",
//            "252611000096": "jPiTI/HZanhOSygCWiZrQSyJdAlhgIWq1y7YY3ZPk9jC5TprRc5+1A6n99tsiZf0Ng7IlWcyHMw4arbs4DlOiA==",
//            "252611000105": "aFio16zXuWIZMARZ7PXb4hbuxW7I5vXViIVq7Wrxj2TSL5W4mCmUQhr4wUuNgIut/+jTpunKZCUZFb1lMecc0A==",
//            "252611000119": "fRo3xFWIWA9fYxnU4ESM+fi3TbkSAazYSMYlHVu2wNgZol8Pq34jn2liBeNJ5ydfZyJYcDFjrHp3BbUVAG4kVA==",
//            "252611000192": "jpb0+ERwZX7ZFMvAuP5clHPbEAkk0a43i7th+ANtc90GHcIOrieq/R0Jddzp8SQswrLNaIeBdmS5KirgnxYLjg==",
//            "252611000205": "C59uJ0TQAJ7roOI8LSU1Tbmext+dTx6H2qlNuHlUt6zoQE6mNoS6mTvYLRuUloZoRk91Bv7k4Zz0Tm8e1Fn2hQ==",
//            "252611000209": "HqMpePiGomW/c0VkMMpnG6l8COAq6shBHEAweDDcl7qfym5X9O9SUvmXAaFLsPaKQCU6TIR+0/NHyjfdurAf1A==",
//            "252611000290": "QyJSRZGfX06e3Nraz9mKWdj0cQo+qOd0kCZgvocNE0gwvHK5LU3w3Svzo+Q8yGe2v6FLMienE/LCjpDz6rN53g==",
//            "252611000303": "OCOAdvJBd2+8sVncSAB/g77gSTbw0nCQMOVHlhhxc99jjxVEH0+hdywdntZ2Kuh91ZqE6sBfdVLS88M5eH8CNQ==",
//            "252611000315": "aOCjwIU77UR0en7J/vrwh0Dm6d3fH3C80/5ut/P5zpMfQyC+qw3I+bTQvypsHgWiZNlE1EpJ1XV1dra9DqhQhQ==",
//            "252611000365": "NDWumGjZELQB+lU0SCW3bSrde5I8Mi+fmSU1awR2+C9Sf/Va3mq+yK1jkUsYurBkJQ8xFYeRHxFmsSqdE18jMg==",
//            "252611000370": "A1IZ32dPNbD79SCcPAAyBev4bHLAxSCSeuig7eGYADqpBI0fDj3bMPWhKyjYyYhDr0pAoz4gD57oB7/OAp7mIg==",
//            "252611000381": "WJIudIqGuWWiCXaR0uAc+NsjByh42cgg0WNwE6J8DaLRU/sjhmFMtqX0yXKqoAckPZsZUNlneylx219hp8wAtw=="
//        ]
//        
//
//
//        private func login() {
//          
//            guard !isLoggingIn else { return }
//            if !userToken.isEmpty {
//                isLoggingIn = true
////                if let token = userToken[userToken]{
////                if UserToken[userToken] != nil {
//                    XMPPManager.shared.authenticateUser(withToken: userToken) { success in
//                        isLoggingIn = false
//                        
//                        if success {
//                            UserDefaults.standard.setValue(userToken, forKey: "UserToken")
//                            
//                            // Navigate to the main chat view (ContentView) upon successful login
//                            //                                       navigateToChat = true
////                        }
//                    }
//                    }
//                }
//            }
//            func xmppStreamDidConnect(_ sender: XMPPStream!) {
//                // Connected to XMPP server, perform authentication
//                guard let stream = sender else { return }
//                
//                let token = "D2vRG//GF9Kov3O6/DIPw+b5U5sw2+9OtrTo/j61+Ute9VF/xvvKY3F8/DPbuWmCo3vdo/hw8duNuASyjiYowg==" // Replace with the appropriate password from the token dictionary
//                let auth = XMPPSCRAMSHA1Authentication(stream: stream, password: token)
//                
//                do {
//                    try stream.authenticate(auth)
//                } catch {
//                    print("Error authenticating with XMPP server: \(error)")
//                    isLoggingIn = false
//                }
//            }
//            func xmppStream(_ sender: XMPPStream!, didReceive iq: XMPPIQ!) -> Bool {
//                if iq.isResultIQ && iq.elementID == "auth1" {
//                    // Authentication successful, handle login success here
//                    print("Login successful!")
//                    isLoggingIn = false
//                    return true
//                } else if iq.isErrorIQ && iq.elementID == "auth1" {
//                    // Authentication failed, handle login failure here
//                    print("Login failed: \(iq)")
//                    isLoggingIn = false
//                    return true
//                }
//                
//                return false
//            }
//          
//            
//         
//            func xmppStreamDidAuthenticate(_ sender: XMPPStream!) {
//                // Authentication successful, handle login success here
//                print("Login successful!")
//                isLoggingIn = false
//            }
//            
//            func xmppStream(_ sender: XMPPStream!, didNotAuthenticate error: DDXMLElement!) {
//                // Authentication failed, handle login failure here
//                print("Login failed: \(String(describing: error))")
//                isLoggingIn = false
//            }
//            
//        }
//    
////    }
//    
//    
//
//struct LoginScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginScreen()
//    }
//}
