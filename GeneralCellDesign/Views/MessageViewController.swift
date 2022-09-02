//
//  MessageViewController.swift
//  GeneralCellDesign
//
//  Created by Başak on 8/31/22.
//

import UIKit

class MessageViewController: UIViewController {
    
    @IBOutlet weak var messageTV: UITableView!
    @IBOutlet weak var messageTF: UITextField!
    
    let viewModel: MessageViewModel = MessageViewModel()
    var incomeUser: User?
    var outgoingUser: User?
    var messageList: [MessageModel]?
    
    var rowHeights: [Int: CGFloat] = [:]
    var rowHeight: CGFloat?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getMessages()
        configureTV()
    }
    
    func configureTV()  {
        messageTV.registerCell(cell: IncomingTVCELL.self)
        messageTV.registerCell(cell: OutgoingTVCELL.self)
        messageTV.delegate = self
        messageTV.dataSource = self
        messageTV.scrollToBottom()
    }
    
    func getMessages()  {
        viewModel.getMessageList()
        outgoingUser = viewModel.outgoingUser
        incomeUser = viewModel.outgoingUser
        messageList = viewModel.messageList
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        messageList?.append(MessageModel(messageCellType: .outgoing, message: messageTF.text!, messageImage: nil, user: outgoingUser!))
        messageTF.text = ""
        messageTV.reloadData()
        messageTV.scrollToBottom()
    }
    
    @IBAction func shareBtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
}

extension MessageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        messageList?.append(MessageModel(messageCellType: .outgoing, message: nil, messageImage: image, user: outgoingUser!))
        messageTV.reloadData()
        messageTV.scrollToBottom()
        self.dismiss(animated: true)
    }
}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = self.rowHeights[indexPath.row]{
            return height
        }else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let message = messageList?[indexPath.row] {
            if message.messageCellType == .incoming  {
                let cell = tableView.dequeueReusableCell(withIdentifier: IncomingTVCELL.className, for: indexPath) as! IncomingTVCELL
                cell.delegate = self
                cell.bindModel(model: message, row: indexPath.row)
                return cell
            }
        
            let  cell = tableView.dequeueReusableCell(withIdentifier: OutgoingTVCELL.className, for: indexPath) as! OutgoingTVCELL
            cell.delegate = self
            cell.bindModel(model: message, row: indexPath.row)
            return cell
        }

        return UITableViewCell()
    }

}

extension MessageViewController: MessageCellDelegate {
    func setHeight(height: CGFloat, row: Int) {
       rowHeights[row] = height
    }
    func beginUpdates() {
        messageTV.beginUpdates()
    }
    func endUpdates() {
        messageTV.endUpdates()
    }
}
