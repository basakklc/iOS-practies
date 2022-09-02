//
//  MessageCellDelegate.swift
//  GeneralCellDesign
//
//  Created by Başak on 9/2/22.
//

import Foundation
import UIKit

protocol MessageCellDelegate {
    func setHeight(height: CGFloat, row: Int)
    func beginUpdates()
    func endUpdates()
}
