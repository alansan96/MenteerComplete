//
//  ProfileDetailViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 26/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {
    
    let sectionHeader=["Introduction","Reccomendation","Work Experiences","Educations","Others"]
    
    let userProfile=User(name: "Berney Klokwazy", image: #imageLiteral(resourceName: "Robin Shue Mentor"),
                         phone: "7988654",
                         email: "berneyk@thatoneemail.com",
                         reviews: [User.textWithIcon(icon: #imageLiteral(resourceName: "picture Icon"), text: "Terry Boggart", text2: "Berney is an okay guy, he is easy to communicate with and very much friendly. He learns fast and he dreams big. I would not be surprised if you are inspired by his thrive."),User.textWithIcon(icon: #imageLiteral(resourceName: "Tim Berkeley Mentor"), text: "Jessica James", text2: "I teached him the ethics of work and he gave me a teaching of the art of never giving up. He is inspiring, let him inspire you and inspire him more if you want to mentor him")],
                         jobExperience: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 3"), text: "Freelance Junior Programmer", text2: "Present")],
                         education: [User.textWithIcon(icon: #imageLiteral(resourceName: "job 2"), text: "Greenland IT Campus", text2: "2014-2019")],
                         others: [User.textWithIcon(icon:#imageLiteral(resourceName: "job 1") ,text: "Programming course at Greenland IT Campus", text2: "2017")],
                         goal:["Be more fluent in Programming","Learn more about work environments and ethics","Build upon my CV and Portfolios","Get more connections to others","More socializing with others"],
                         desc:"My name is Berney, and i am a fresh graduate from Greenland IT Univeristy. I am now a freelance programming with minor work on that, but i am trying to get a serious job. In order to get that, i need to be able to know more about the work environment, how to socialize with people more, and build upon my CVs. I hope that i can learn something from all of you and return the favor.")

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileJob: UILabel!
    @IBOutlet weak var profilePhone: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileTableView.delegate = self
        profileTableView.dataSource = self
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        profileImage.image = userProfile.Image
        profileName.text = userProfile.name
        profileJob.text = userProfile.jobExperience.last?.text
        profilePhone.text = userProfile.phone
        profileEmail.text = userProfile.email
    }

}

extension ProfileDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.textLabel?.font = UIFont.systemFont(ofSize: 22)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 130
        default:
            return 75
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return userProfile.reviews.count
        case 2:
            return userProfile.jobExperience.count
        case 3:
            return userProfile.education.count
        case 4:
            return userProfile.others.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let row = userProfile.desc
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell") as! ProfileDescriptionTableViewCell
            
            cell.setCell(data: row)
            return cell
            
        case 1:
            let row = userProfile.reviews[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ProfileReviewsTableViewCell
            
            cell.setCell(data:row)
            return cell
            
        case 2:
            let row = userProfile.jobExperience[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell") as! ProfileExperiencesTableViewCell
            
            cell.setCell(data:row)
            return cell
            
        case 3:
            let row = userProfile.education[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell") as! ProfileExperiencesTableViewCell
            
            cell.setCell(data: row)
            return cell
            
        case 4:
            let row = userProfile.others[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "experienceCell") as! ProfileExperiencesTableViewCell
            
            cell.setCell(data: row)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
}
