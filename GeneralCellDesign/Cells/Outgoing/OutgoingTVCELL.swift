//
//  OutgoingTVCELL.swift
//  GeneralCellDesign
//
//  Created by Başak on 8/31/22.
//

import UIKit

class OutgoingTVCELL: UITableViewCell {
    
    @IBOutlet weak var messageContainerView: UIView!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var messageImgView: UIImageView!
    
    var delegate: MessageCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindModel(model: MessageModel, row: Int)  {
        if let messageImage = model.messageImage{
            DispatchQueue.main.async {
                self.messageImgView.image = messageImage
                self.setCellHeight(messageImage: messageImage, row: row)
            }
            configureCell(isHiddenForImage: false)
        }else{
            if let message = model.message{
                messageLbl.text = message
                configureCell(isHiddenForImage: true)
            }
        }
    }
    
    func configureCell(isHiddenForImage: Bool) {
        messageImgView.isHidden = isHiddenForImage
        messageContainerView.isHidden = !isHiddenForImage
    }
    
    func setCellHeight(messageImage: UIImage, row: Int)  {
        let aspectRatio = messageImage.size.height / messageImage.size.width
        let imageHeight = self.messageImgView.frame.width *  aspectRatio
        self.delegate?.beginUpdates()
        self.delegate?.setHeight(height: imageHeight, row: row)
        self.delegate?.endUpdates()
    }
}
