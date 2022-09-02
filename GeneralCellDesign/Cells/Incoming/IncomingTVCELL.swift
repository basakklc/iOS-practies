//
//  IncomingTVCELL.swift
//  GeneralCellDesign
//
//  Created by Başak on 8/31/22.
//

import UIKit

class IncomingTVCELL: MessageBaseTVCell {

    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var messageImgView: UIImageView!
    @IBOutlet weak var messageContainerView: UIView!
    
    var delegate: MessageCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindModel(model: MessageModel,row: Int )  {
    
        profileImgView.image = UIImage(systemName: model.user.image)
      
        if let messageImage = model.messageImage {
            DispatchQueue.main.async {
                self.messageImgView.image = messageImage
                self.setCellHeight(messageImage: messageImage, row: row, imageView: self.messageImgView, delegate: self.delegate!)
            }
            configureCell(isHiddenForImage: false)
        }else{
            if let message = model.message {
                messageLbl.text = message
                configureCell(isHiddenForImage: true)
            }
        }
    }
    
    func configureCell(isHiddenForImage: Bool) {
        messageImgView.isHidden = isHiddenForImage
        messageContainerView.isHidden = !isHiddenForImage
    }
    
}
