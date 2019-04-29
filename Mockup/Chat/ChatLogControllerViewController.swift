//
//  ChatLogControllerViewController.swift
//  Mockup
//
//  Created by Alan Santoso on 29/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import Firebase

class ChatLogControllerViewController: UIViewController {
    private let cellId = "chatCell"
    
    @IBOutlet weak var chatAreaView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var tableViews: UITableView!
    @IBOutlet weak var inputTextFIeld: UITextField!
    
    var allMessage = [Message]()
    var isSender : Bool = false
    
    var user : LoginUser? {
        didSet{
            navigationItem.title = user?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setup()
        observeMessegeSender()
        setupBefore()
        setupKeyboardObserver()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        
        
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        inputTextFIeld.resignFirstResponder()
    }
    
    func setupKeyboardObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillAppear), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func handleKeyboardWillAppear(notification: NSNotification){
        
        let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        //print(keyboardSize?.height) tinggi keyboard
        containerBottomAnchor?.constant = -keyboardSize!.height+70
        
    }
    
    @objc func handleKeyboardWillHide(notification: NSNotification){
        
        let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        //print(keyboardSize?.height) //tinggi keyboard
        
        
        containerBottomAnchor?.constant = 0
        
    }
    
    
    
    
    var containerBottomAnchor :NSLayoutConstraint?
    
    func setupBefore(){
        
        
        //        containerBottomAnchor = chatAreaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        containerBottomAnchor = stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        containerBottomAnchor?.isActive = true
        
    }
    
    
    func setup(){
        
        inputTextFIeld.delegate = self
        
        tableViews.separatorStyle = .none
        tableViews.backgroundColor = UIColor(red: 236, green: 240, blue: 246)
        
        inputTextFIeld.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 2.0))
        inputTextFIeld.leftViewMode = .always
        
        tableViews.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    
    @IBAction func handleSend(_ sender: Any) {
        sendAction()
    }
    
    func observeMessegeSender() {
        let currentLoginId = Auth.auth().currentUser!.uid
        
        
        let ref = Database.database().reference().child("messages")
        ref.queryOrdered(byChild: "timestamp").observe(.childAdded, with: { snapshot in
            
            
            let snapshotValue = snapshot.value as! NSDictionary
            let toId = snapshotValue["toId"] as! String
            let text = snapshotValue["text"] as! String
            let fromId = snapshotValue["fromId"] as! String
            let timestamp = snapshotValue["timestamp"] as! String
            
            let temp = Message(fromId: fromId, text: text, timestamp: timestamp, toId: toId)
            
            
            
            if fromId == currentLoginId  && toId == self.user?.id{
                temp.isIncoming = false
                self.allMessage.append(temp)
                
            }
            
            if fromId == self.user?.id && toId == currentLoginId{
                temp.isIncoming = true
                self.allMessage.append(temp)
                
                
            }
            
            
            DispatchQueue.main.async {
                
                print("finished")
                self.tableViews.reloadData()
                
                
            }
            
        }) { (Error) in
            print("Somethingwrong")
        }
        
        
        let messageDB = Database.database().reference().child("User")
        messageDB.queryOrdered(byChild: "role")
            .queryEqual(toValue: "mentee")
            .observe(.childAdded, with: { snapshot in
                
                let snapshotValue = snapshot.value as! NSDictionary
                let text = snapshotValue["name"] as! String
                print(text)
            })
        
    }
    
    func sendAction(){
        let ref = Database.database().reference().child("messages")
        let childref = ref.childByAutoId()
        
        let toId = user!.id!
        let fromId = Auth.auth().currentUser!.uid
        let timestamp : NSNumber = NSNumber(value: Int(NSDate().timeIntervalSince1970))
        let timestampString = "\(timestamp)"
        
        
        let values = ["text" : inputTextFIeld.text!, "toId" : toId, "fromId" : fromId, "timestamp": timestampString ]
        childref.updateChildValues(values)
        
        inputTextFIeld.text = ""
    }
    
    
    
    
}




extension ChatLogControllerViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ChatViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellId)
        cell.configure(with: allMessage[indexPath.row])
        
        
        return cell
        
    }
}


extension ChatLogControllerViewController: UITextFieldDelegate {
    
    //handle when keyboard is shown and hidden
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("masuk sini fungsinya2")
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        sendAction()
        return true
    }
    
    
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

