//
//  MentorProfikeViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 26/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class MentorProfileViewController: UIViewController {
    
    var profileDetail:User?
    
    let sectionHeader=["Introduction","Method","Reccomendation","Work Experiences","Educations","Others"]
    
    @IBOutlet weak var profileDetailImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileJobLabel: UILabel!
    @IBOutlet weak var profilePhoneLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    @IBOutlet weak var profileMaterialLabel: UILabel!
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var profileDetailTableView: UITableView!
    
    override func viewDidLoad() {
        profileDetailTableView.delegate = self
        profileDetailTableView.dataSource = self
        setUI()
        super.viewDidLoad()
        profileButton.layer.cornerRadius = 10
    
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        profileDetailImage.image = profileDetail?.Image
        profileNameLabel.text = profileDetail?.name
        profilePhoneLabel.text = profileDetail?.phone
        profileEmailLabel.text = profileDetail?.email
        profileMaterialLabel.text = profileDetail?.material
        navItem.title = profileDetail?.name
        profileJobLabel.text = profileDetail?.jobExperience.last?.text
    }

    @IBAction func tapChatButton(_ sender: UIButton) {
        performSegue(withIdentifier: "profileToChat", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ChatDetailViewController
        vc.personName = profileDetail?.name
        vc.hidesBottomBarWhenPushed = true
    }
}

extension MentorProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.textLabel?.font = UIFont.systemFont(ofSize: 22)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 125
        case 1:
            if profileDetail?.method == nil{
                return 0
            }else{
                return 125
            }
        case 2:
            return 140
        default:
            return 75
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            if profileDetail?.method == nil{
                return ""
            }else{
                return sectionHeader[section]
            }
        default:
             return sectionHeader[section]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1:
            return 1
        case 2:
            return (profileDetail?.reviews.count ?? 0)
        case 3:
            return (profileDetail?.jobExperience.count ?? 0)
        case 4:
            return profileDetail?.education.count ?? 0
        case 5:
            return profileDetail?.others.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            guard let row = profileDetail?.desc else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as! ProfileDescriptionTableViewCell
            
            cell.setCell(data: row)
            return cell
            
        case 1:
            guard let row = profileDetail?.method else { return UITableViewCell()  }
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell")as! ProfileDescriptionTableViewCell
            
            cell.setCell(data: row)
            return cell
            
        case 2:
            guard let row = profileDetail?.reviews[indexPath.row] else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ProfileReviewsTableViewCell
            
            cell.setCell(data:row)
            return cell
            
        case 3:
            guard let row = profileDetail?.jobExperience[indexPath.row] else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell") as! ProfileExperiencesTableViewCell
            
            cell.setCell(data:row)
            return cell
            
        case 4:
            guard let row = profileDetail?.education[indexPath.row] else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell") as! ProfileExperiencesTableViewCell
            
            cell.setCell(data: row)
            return cell
            
        case 5:
            guard let row = profileDetail?.others[indexPath.row] else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell") as! ProfileExperiencesTableViewCell
            
            cell.setCell(data: row)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
}
