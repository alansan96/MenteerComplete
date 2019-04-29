//
//  ScheduleNewViewController.swift
//  Mockup
//
//  Created by Alan Santoso on 29/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ScheduleNewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var schedule = [Schedule]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var s1 = Schedule(title: "Start working on my persnoal blog", date: "2019/04/21")
        var s2 = Schedule(title: "Learn New Skill", date: "2019/05/23")
         var s3 = Schedule(title: "Do the task list page", date: "2019/06/21")
         var s4 = Schedule(title: "Buy a new domain name", date: "2019/05/13")
        // Do any additional setup after loading the view.
        
        schedule.append(s1)
        schedule.append(s2)
        schedule.append(s3)
        schedule.append(s4)
        
        let vc : AddScheduleViewController = AddScheduleViewController(nibName: nil, bundle: nil)
        
        print(vc.skedul2.count)
        
        if vc.skedul2.count != 0 {
            var getThatValue = vc.skedul2
            schedule = getThatValue
            tableView.reloadData()
            print("masuk sini?")
        }
        
        
        

    }
    
    
    

}

extension ScheduleNewViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! ScheduleTableViewCell
        
        cell.setScehdule(s: schedule[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    
}
