//
//  JobSearchViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 18/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class JobSearchViewController: UIViewController {
    
    var jobs:[Job] = []
    
    @IBOutlet weak var jobsTableView: UITableView!
    
    override func viewDidLoad() {
        jobsTableView.delegate = self
        jobsTableView.dataSource = self
        super.viewDidLoad()
        jobs = populateJobsArray()
    }
    
    func populateJobsArray()->[Job]{
        var tempArray:[Job] = []
        
        tempArray.append(Job(jobImage: #imageLiteral(resourceName: "job 4"), jobName: "Programmer Needed", jobDesc: "Needed a programmer for Pete Goreng's first ever app to be launched. If you fit the description/requirement below, feel free to apply to us. We will select among those who applied. Good luck and we hope that we can cooperate, future Pete Goreng Developer !", requirement: ["Able to use Javascript","Able and willing to learn in using JS Frameworks","Can work in teams"], jobCompany: "Pete Goreng DevTeam"))
        
        tempArray.append(Job(jobImage: #imageLiteral(resourceName: "job 1"), jobName: "Interior Designer Needed in Roserie", jobDesc: "Roserie inc. is finding a dedicated Interior Designer, full time. We are hoping that this interior Designer is able to work with us with our various projects and stay dedicated with good manners. Requirements are listed below, and we encourage you to apply if you meet the requirements. We do hope we can work together in the future.", requirement: ["Design Major","Willing to learn, especially deeper into interior design","Portfolios of your work","Good manners and dedicated"], jobCompany: "Roserie.Inc"))
        
        return tempArray
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! JobDetailsViewController
        vc.job = sender as? Job
    }

}

extension JobSearchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = jobs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell") as! JobSearchTableViewCell
        
        cell.setCell(jobs: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tempJobs = jobs[indexPath.row]
        performSegue(withIdentifier: "jobMasterToDetails", sender: tempJobs)
        
    }
    
}
