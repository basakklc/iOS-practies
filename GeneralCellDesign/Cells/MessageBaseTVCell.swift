//
//  MessageBaseTVCell.swift
//  GeneralCellDesign
//
//  Created by Başak on 9/2/22.
//

import UIKit

class MessageBaseTVCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCellHeight(messageImage: UIImage, row: Int, imageView: UIImageView, delegate: MessageCellDelegate)  {
        let aspectRatio = messageImage.size.height / messageImage.size.width
        let imageHeight = imageView.frame.width *  aspectRatio
        delegate.beginUpdates()
        delegate.setHeight(height: imageHeight, row: row)
        delegate.endUpdates()
    }
}
