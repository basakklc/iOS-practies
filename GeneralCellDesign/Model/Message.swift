//
//  Message.swift
//  GeneralCellDesign
//
//  Created by Başak on 8/31/22.
//

import Foundation
import UIKit

enum MessageCellType {
    case incoming
    case outgoing
}

struct MessageModel {
    let messageCellType: MessageCellType
    let message: String?
    let messageImage: UIImage?
    let user: User
}

struct User {
    let name: String
    let image: String
}
