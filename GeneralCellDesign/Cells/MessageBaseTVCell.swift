//
//  MessageBaseTVCell.swift
//  GeneralCellDesign
//
//  Created by Başak on 9/2/22.
//

import UIKit

class MessageBaseTVCell: UITableViewCell {
    
    var delegate: MessageCellDelegate?
    @IBOutlet weak var messageImgView: UIImageView!
    @IBOutlet weak var messageContainerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCellHeight(messageImage: UIImage, row: Int)  {
        let aspectRatio = messageImage.size.height / messageImage.size.width
        let imageHeight = messageImgView.frame.width *  aspectRatio
        delegate?.beginUpdates()
        delegate?.setHeight(height: imageHeight, row: row)
        delegate?.endUpdates()
    }
    
    func configureCell(isHiddenForImage: Bool) {
        messageImgView.isHidden = isHiddenForImage
        messageContainerView.isHidden = !isHiddenForImage
    }
}
