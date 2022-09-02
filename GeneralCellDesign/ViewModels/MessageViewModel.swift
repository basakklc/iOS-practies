//
//  MessageViewModel.swift
//  GeneralCellDesign
//
//  Created by Başak on 9/1/22.
//

import Foundation
import UIKit

class MessageViewModel {
    var incomeUser: User?
    var outgoingUser: User?
    var messageList: [MessageModel]?
    
    func getMessageList() {
        incomeUser = User(name: "Başak", image: "person.crop.square.fill")
        outgoingUser = User(name: "Selin", image: "person.crop.square.fill")
        messageList = [
            MessageModel(messageCellType: .incoming, message: nil, messageImage: UIImage(named: "tree"), user: incomeUser!),
            MessageModel(messageCellType: .outgoing, message: "Lorem Ipsum has been the industry's standard dummy", messageImage: nil,user:  outgoingUser!),
            MessageModel(messageCellType: .incoming, message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", messageImage: nil, user: outgoingUser!),
            MessageModel(messageCellType: .outgoing, message: " Ut enim ad minim veniam, quis nostrud", messageImage: nil, user: outgoingUser!),
            MessageModel(messageCellType: .outgoing, message: "Excepteur sint occaecat cupidatat non proident", messageImage: nil,user: incomeUser!),
            MessageModel(messageCellType: .outgoing, message: nil, messageImage: UIImage(named: "sea"),user: outgoingUser!),
            MessageModel(messageCellType: .incoming, message: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.", messageImage: nil,user: incomeUser!),
            MessageModel(messageCellType: .incoming, message: "But also the leap into electronic typesetting", messageImage: nil, user: incomeUser!),
            MessageModel(messageCellType: .incoming, message: nil, messageImage: UIImage(named: "tree"),user: incomeUser!),
            MessageModel(messageCellType: .outgoing, message: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", messageImage: nil,user:  outgoingUser!),
            MessageModel(messageCellType: .incoming, message: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,", messageImage: nil,user: incomeUser!),
            MessageModel(messageCellType: .outgoing, message: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages", messageImage: nil,user: outgoingUser!),
            MessageModel(messageCellType: .outgoing, message: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", messageImage: nil,user:  outgoingUser!),
            MessageModel(messageCellType: .incoming, message: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,", messageImage: nil,user: incomeUser!),
            MessageModel(messageCellType: .outgoing, message: "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages", messageImage: nil,user: outgoingUser!)
        ]
    }
}

