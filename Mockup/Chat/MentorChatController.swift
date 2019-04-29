//
//  MentorChatController.swift
//  Mockup
//
//  Created by Alan Santoso on 29/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit
import Firebase

class MentorChatController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    

    var uss = [LoginUser]()
    var imageUser = ["Amy", "Ayu", "Bagus", "Castro","Robin Shue Mentor", "Tim Berkeley Mentor", "Amy", "Ayu", "Bagus", "Castro","Robin Shue Mentor", "Tim Berkeley Mentor"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.tableFooterView = UIView()
        loadData()

    }
    
    func loadData(){
        
        let messageDB = Database.database().reference().child("User")
        messageDB.queryOrdered(byChild: "role")
            .queryEqual(toValue: "mentor")
            .observe(.childAdded, with: { snapshot in
                
                
                let snapshotValue = snapshot.value as! NSDictionary
                let text = snapshotValue["name"] as! String
                let role = snapshotValue["role"] as! String
                
                let userId = snapshot.key
                
                let userTmp = LoginUser(name: text, role: role)
                userTmp.id = userId
                
                let currentLoginId = Auth.auth().currentUser!.uid
                if currentLoginId != snapshot.key{
                    self.uss.append(userTmp)
                }
                
                print(self.uss)
                
                DispatchQueue.main.async {
                    
                    print("finished")
                    self.tableView.reloadData()
                }
                
                
            })
    }
    
    
}




extension MentorChatController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let users = uss[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "userChatCell") as! UserViewCell
        cell.setUser(user: users)
        
        
        cell.userImage.image = UIImage(named: imageUser[indexPath.row])
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let chat = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: "ChatLog") as? ChatLogControllerViewController else { return }
        
        
        let ussers = self.uss[indexPath.row]
        chat.user = ussers
        
        //let chat :UIViewController = ChatLogController()
        navigationController?.pushViewController(chat, animated: true)
    }
    
    


}
