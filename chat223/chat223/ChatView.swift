//
//  ChatView.swift
//  chat223
//
//  Created by abdiqani on 25/07/23.
//

import SwiftUI
import XMPPFramework

struct ChatView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @EnvironmentObject var viewModel: ChatViewModel
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    @State private var messageIDToScroll: UUID?
    
    var body: some View {
       
            VStack(spacing: 0){
                GeometryReader { reader in
                    ScrollView {
                        ScrollViewReader { scrollReader in                   getMessagesView(viewWidth: reader.size.width)
                                .padding(.horizontal)
                                .onChange(of: messageIDToScroll) { _ in
                                    if let messageID = messageIDToScroll{
                                        scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                    }
                                    
                                }
                                .onAppear {
                                    if let messageID = chat.messages.last?.id {
                                        scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                                    }
                                }
                        }
                    }
                }
                .padding(.bottom, 5)
                
                toolbarView()
            }
            
            .padding(.top, 1)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: navBarLeadingBtn, trailing: navBarTrailingBtn)
            .onAppear {
//                fetchMessages()
                viewModel.markAsUnread(false, chat: chat)
            }
        }
        var navBarTrailingBtn: some View {
            HStack {
                Button(action: {}) {
                    Image(systemName: "video")
                }
                Button(action: {}) {
                    Image(systemName: "phone")
                }
            }
        }
        var navBarLeadingBtn: some View {
            Button(action: {}) {
                HStack {
                    Image(chat.person.imgString)
                        .resizable()
                        .frame(width: 45, height: 50)
                        .clipShape(Circle())
                    Text(chat.person.name).bold()
                }
                .foregroundColor(.black)
                
            }
        }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy){
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn: nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 37
            HStack {
                TextField("Message ...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                    
                        .frame(width: height, height: height)
                        .background(
                        Circle()
                            .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }

    func sendMessage() {
        let recipientJID = XMPPJID(string: "recipient_jid@uatchat2.waafi.com")
        let message = XMPPMessage(type: "chat", to: recipientJID)
        message.addBody(text)
//        XMPPManager.shared.xmppStream.sender(message)
        if let message = viewModel.sendMessage(text, in: chat) {
            text = ""
            messageIDToScroll = message.id
        }
    }
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0) {
            let sectionMessages = viewModel.getSectionMessages(for: chat)
            ForEach(sectionMessages.indices, id: \.self) { sectionIndex in
                let messages = sectionMessages[sectionIndex]
                Section(header: sectionHeader(firstMessage: messages.first!)) {
                    ForEach(chat.messages) { message in
                        let isReceived = message.type == .Reveived
                        HStack {
                            ZStack {
                                Text(message.text)
                                    .padding(.horizontal)
                                    .padding(.vertical, 12)
                                    .background(isReceived ? Color.black.opacity(0.2) : .green.opacity(0.9))
                                    .cornerRadius(13)
                            }
                            .frame(width: viewWidth * 0.7, alignment: isReceived ? .leading : .trailing)
                            .padding(.vertical)
                            //                    .background(Color.blue)
                        }
                        .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
                        .id(message.id)
                    }
                }
            }
        }
    }
    func sectionHeader(firstMessage message: Message) -> some View {
        ZStack {
            Text(message.date.descriptiveString(dateStyle: .medium))
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .regular))
                .frame(width: 120)
                .padding(.vertical, 5)
                .background(Capsule().foregroundColor(.blue))
        }
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChatView(chat: Chat.sampleChat[0])
                .environmentObject(ChatViewModel())
        }
    }
}
