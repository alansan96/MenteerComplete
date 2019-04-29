//
//  ViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 18/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //INITIALIZE USER
    @IBOutlet weak var homeNavItem: UINavigationItem!
    
    let userProfile=User(name: "Berney Klokwazy", image: #imageLiteral(resourceName: "Robin Shue Mentor"),
                         phone: "7988654",
                         email: "berneyk@thatoneemail.com",
                         reviews: [User.textWithIcon(icon: #imageLiteral(resourceName: "dev-setup"), text: "Wozniak Wallace", text2: "Berney is an okay guy, he is easy to communicate with and very much friendly. He learns fast and he dreams big. I would not be surprised if you are inspired by his thrive."),User.textWithIcon(icon: #imageLiteral(resourceName: "ss-uipickerview-card"), text: "Ellenda Warren", text2: "I teached him the ethics of work and he gave me a teaching of the art of never giving up. He is inspiring, let him inspire you and inspire him more if you want to mentor him")],
                         jobExperience: [User.textWithIcon(icon: #imageLiteral(resourceName: "dev-setup"), text: "Freelance Junior Programmer", text2: "Present")],
                         education: [User.textWithIcon(icon: #imageLiteral(resourceName: "vlog-4"), text: "Greenland IT Campus", text2: "2014-2019")],
                         others: [User.textWithIcon(icon:#imageLiteral(resourceName: "vlog-4") ,text: "Programming course at Greenland IT Campus", text2: "2017")],
                         goal:["Be more fluent in Programming","Learn more about work environments and ethics","Build upon my CV and Portfolios","Get more connections to others","More socializing with others"],
                         desc:"My name is Berney, and i am a fresh graduate from Greenland IT Univeristy. I am now a freelance programming with minor work on that, but i am trying to get a serious job. In order to get that, i need to be able to know more about the work environment, how to socialize with people more, and build upon my CVs. I hope that i can learn something from all of you and return the favor.")
    
    //OUTLETS
    
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var mentorHomeCollectionView: UICollectionView!

    //OTHER VARIABLES
    
    let sectionHeaders = ["Goals", "Upcoming"]
    let mentorImages:[UIImage] = [#imageLiteral(resourceName: "Brittany Kelsey"),#imageLiteral(resourceName: "Time Berkeley"),#imageLiteral(resourceName: "Brittany Kelsey-1"),#imageLiteral(resourceName: "Time Berkeley")]
    let scheduledName = "Terry Bogart"
    let scheduledText=["Building a great CV","1 May 2019, 12.00-13.00","Face to face session"]
    let scheduleImage = #imageLiteral(resourceName: "picture Icon")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //DELEGATES AND DATASOURCE PROTOCOLS
        homeTableView.delegate = self
        homeTableView.dataSource = self
        mentorHomeCollectionView.delegate = self
        mentorHomeCollectionView.dataSource = self
        
        homeNavItem.title = userProfile.name
        
        let rightButton1:UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.organize, target: self, action: #selector(tappedSchedule))
        let rightButton2:UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: nil)
        let dateItem:UIBarButtonItem = UIBarButtonItem.init(title: "30 April 2019", style: .plain, target: self, action: nil)
    
        self.navigationItem.setRightBarButtonItems([rightButton1,rightButton2,dateItem], animated: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func tappedSchedule(){
        performSegue(withIdentifier: "toCalendar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! CalendarViewController
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource{
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.textLabel?.font = UIFont.systemFont(ofSize: 22)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 30
        case 1:
            return 180
        default:
            return 180
        }
    }
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print(sectionHeaders.underestimatedCount)
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionHeaders[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return userProfile.goal.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let row = userProfile.goal[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as! HomeGoalsTableViewCell
            
            cell.setCell(data: row)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "comingUpCell") as! HomeUpcomingTableViewCell
            
            cell.setCell(image: scheduleImage, name: scheduledName, material: scheduledText[0], schedule: scheduledText[1], type: scheduledText[2])
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 22

        default:
            return 22
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 30
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    
    //SEPARATOR
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mentorImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mentorsCell", for: indexPath) as! HomeMentorCollectionViewCell
        
        cell.setCell(data: mentorImages[indexPath.row])
        
        return cell
    }
    
    
}
