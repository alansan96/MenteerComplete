//
//  ConnectViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 18/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {

    var connectMentor:[Mentor]=[]
    var connectMentee:[Mentee]=[]
    var switchInteger = 0
    
    @IBOutlet weak var connectSegmentSwitch: UISegmentedControl!
    @IBOutlet weak var connectTableView: UITableView!
    
    override func viewDidLoad() {
        
        connectMentee = populateMenteeArray()
        connectMentor = populateMentorArray()
        
        connectTableView.delegate = self
        connectTableView.dataSource = self
        
        super.viewDidLoad()
    }
    
    //POPULATE MENTOR ARRAY
    
    func populateMentorArray()->[Mentor]{
        var tempConnectArray:[Mentor]=[]
        tempConnectArray.append(Mentor(name: "Sandy Roberts", image: #imageLiteral(resourceName: "Castro"), phone: "993465", email: "jackkunma@email.com",
                                       reviews: [User.textWithIcon(icon: #imageLiteral(resourceName: "Bagus"), text:"Kalashidan",text2: "Jack is a good mentor, he teached with a laid back demeanor and is expressive in his explanations. He also uses creative methods"),User.textWithIcon(icon: #imageLiteral(resourceName: "Amy"), text: "Lisa Smith", text2: "Nothing more i could say, excellent mentor, would love to be mentored by him again")],
                                       
                                       jobExperience: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 6"), text: "Alibaba System Analyst", text2: "2013-2015"),User.textWithIcon(icon: #imageLiteral(resourceName: "job 4"), text: "Programmer at Agate", text2: "2015-Present"),User.textWithIcon(icon: #imageLiteral(resourceName: "job 5"), text: "Freelance Developer", text2:"Freelance Web Programmer")],
                                       education: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 6"), text: "Binus University, Game Application Technology", text2: "2009-2013")],
                                       others: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 1"), text: "Udemy Teacher at Programmer", text2: "2013-2017")],
                                       goal: ["Be an independent Developer","Be able to teach person to be better"], desc: "I am Jack Kun, my friends call me Jack. I'm a progammer, currently working at Agate. I used to be a system analyst and another programmer. I'm here to teach programming and maybe teach more about how to survive as one in the work experience. I do hope i can help you all in your procerss to grow.", material: "Programming and Career Experience", method: "I mostly do video guidance mentroing since i am working, but i also do face to face guidance when needed or when requested in the weekends. I mostly ask my mentee first what they are looking for, and from there, i would construct some type of material that would help them do so, while also being supervised."))
        
        tempConnectArray.append(Mentor(name: "Elizabeth More", image: #imageLiteral(resourceName: "Brittany mentor"), phone: "993465", email: "jackkunma@email.com",
                                        reviews: [User.textWithIcon(icon: #imageLiteral(resourceName: "picture Icon"), text:"Terry Bogart",text2: "Jack is a good mentor, he teached with a laid back demeanor and is expressive in his explanations. He also uses creative methods"),User.textWithIcon(icon: #imageLiteral(resourceName: "Bagus"), text: "Kalashidan", text2: "Nothing more i could say, excellent mentor, would love to be mentored by him again")],
                                        
                                        jobExperience: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 4"), text: "Alibaba System Analyst", text2: "2013-2015"),User.textWithIcon(icon: #imageLiteral(resourceName: "job 3"), text: "Freelance Developer", text2:"Freelance Web Programmer"),User.textWithIcon(icon: #imageLiteral(resourceName: "job 3"), text: "Programmer at Agate", text2: "2015-Present")],
                                        education: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 6"), text: "Binus University, Game Application Technology", text2: "2009-2013")],
                                        others: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 5"), text: "Udemy Teacher at Programmer", text2: "2013-2017")],
                                        goal: ["Be an independent Developer","Be able to teach person to be better"], desc: "I am Jack Kun, my friends call me Jack. I'm a progammer, currently working at Agate. I used to be a system analyst and another programmer. I'm here to teach programming and maybe teach more about how to survive as one in the work experience. I do hope i can help you all in your procerss to grow.", material: "Programming and Career Experience", method: "I mostly do video guidance mentroing since i am working, but i also do face to face guidance when needed or when requested in the weekends. I mostly ask my mentee first what they are looking for, and from there, i would construct some type of material that would help them do so, while also being supervised."))
        
        tempConnectArray.append(Mentor(name: "Jessica James", image: #imageLiteral(resourceName: "Tim Berkeley Mentor"), phone: "993465", email: "jackkunma@email.com",
                                       reviews: [User.textWithIcon(icon: #imageLiteral(resourceName: "Profile icon menu bar - Bailey"), text:"Johnny Alpha",text2: "Jack is a good mentor, he teached with a laid back demeanor and is expressive in his explanations. He also uses creative methods"),User.textWithIcon(icon: #imageLiteral(resourceName: "Johnny Dunham mentor"), text: "Ricky Joshi", text2: "Nothing more i could say, excellent mentor, would love to be mentored by him again")],
                                       
                                       jobExperience: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 1"), text: "Alibaba System Analyst", text2: "2013-2015"),User.textWithIcon(icon: #imageLiteral(resourceName: "job 6"), text: "Programmer at Agate", text2: "2015-Present"),User.textWithIcon(icon: #imageLiteral(resourceName: "job 6"), text: "Freelance Developer", text2:"Freelance Web Programmer")],
                                       education: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 2"), text: "Binus University, Game Application Technology", text2: "2009-2013")],
                                       others: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 1"), text: "Udemy Teacher at Programmer", text2: "2013-2017")],
        goal: ["Be an independent Developer","Be able to teach person to be better"], desc: "I am Jack Kun, my friends call me Jack. I'm a progammer, currently working at Agate. I used to be a system analyst and another programmer. I'm here to teach programming and maybe teach more about how to survive as one in the work experience. I do hope i can help you all in your procerss to grow.", material: "Programming and Career Experience", method: "I mostly do video guidance mentroing since i am working, but i also do face to face guidance when needed or when requested in the weekends. I mostly ask my mentee first what they are looking for, and from there, i would construct some type of material that would help them do so, while also being supervised."))
        
        return tempConnectArray
    }
    
    //POPULATE MENTEE ARRAY
    
    func populateMenteeArray()->[Mentee]{
        var tempConnectArray:[Mentee]=[]
        
        tempConnectArray.append(Mentee(name: "Martin", image: #imageLiteral(resourceName: "Ayu"), phone: "993465", email: "martin@email.com",
                                       reviews: [User.textWithIcon(icon: #imageLiteral(resourceName: "Castro"), text:"Jack Kun",text2: "Martin is a bit slow, but he tries hard and really tries to overcome that, and i personally that's a great attribute of him. Persevere and he will become a great mentee, even teach you one or two things.")],
                                       jobExperience: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 1"), text: "Programmer Intern at Lozze Corp", text2: "2018-Present")],
                                       education: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 1"), text: "Cooperland University at Computer Science", text2: "2015-2019")],
                                       others: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 2"), text: "Cooperland Univeristy Track Team", text2: "2016-2018")],
                                       goal: ["Be an independent Developer","Be able to be better"], desc: "I am Martin, a fresh graduate from Cooperland University at 2019, and i have been at intern for a year, but now i don't know where to go now. I think i need some guidance on the work environment and in prohgramming skill. Looking forward to know you all !"))
        
        return tempConnectArray
    }
    
    @IBAction func switchSegmentSwitched(_ sender: Any) {
        switchInteger = connectSegmentSwitch.selectedSegmentIndex
        connectTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toChatDetail"{
            let vc = segue.destination as! ChatDetailViewController
            vc.personName = sender as? String
            vc.hidesBottomBarWhenPushed = true

        }else if segue.identifier=="connectDetails"{
            let vc = segue.destination as! MentorProfileViewController
            vc.profileDetail = sender as? User
            vc.hidesBottomBarWhenPushed = true
        }
    }
}

extension ConnectViewController:ConnectCellDelegate{
    func didTapRequestButton() {
        
    }
    
    func didTapStartChatButton(name: String) {
        performSegue(withIdentifier: "toChatDetail", sender: name)
    }
    
    
}

extension ConnectViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch switchInteger {
        case 0:
            return connectMentor.count
        case 1:
            return connectMentee.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch switchInteger {
        case 0:
            let row = connectMentor[indexPath.row]
            let cell = connectTableView.dequeueReusableCell(withIdentifier: "connectCell") as! ConnectTableViewCell
            
            cell.delegate = self
            cell.createCell(person: row)
    
            cell.connectButton.isEnabled = true
            cell.connectButton.isHidden = false
            
            if cell.nameLabel.text == "Sandy Roberts"{
                cell.connectButton.isHidden = true
            }
            
//            cell.connectButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            cell.connectButton.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            
            return cell
            
        case 1:
            let row = connectMentee[indexPath.row]
            let cell = connectTableView.dequeueReusableCell(withIdentifier: "connectCell") as! ConnectTableViewCell
            
            cell.delegate = self
            cell.createCell(person: row)
            cell.connectButton.isEnabled = false
            cell.connectButton.isHidden = true
    
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch switchInteger {
        case 0:
            let tempArray = connectMentor[indexPath.row]
            performSegue(withIdentifier: "connectDetails", sender:tempArray)
        case 1:
            let tempArray = connectMentee[indexPath.row]
            performSegue(withIdentifier: "connectDetails", sender:tempArray)
        default:
            print("Cannot Segue")
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
