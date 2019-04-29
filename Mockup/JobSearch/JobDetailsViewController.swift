//
//  JobDetailsViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 24/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class JobDetailsViewController: UIViewController {
    
    var job:Job?

    @IBOutlet weak var jobDetailImage: UIImageView!
    @IBOutlet weak var jobDetailName: UILabel!
    @IBOutlet weak var jobDetailCompany: UILabel!
    @IBOutlet weak var jobDetailTableView: UITableView!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var jobNameItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        jobDetailTableView.delegate = self
        jobDetailTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        jobDetailImage.image = job?.jobImage
        jobDetailName.text = job?.jobName
        jobDetailCompany.text = job?.jobCompany
        jobDescriptionLabel.text = job?.jobDesc
        jobNameItem.title = job?.jobCompany
    }

}

extension JobDetailsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        header.textLabel?.font = UIFont.systemFont(ofSize: 22)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Requirement"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (job?.requirement.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = job?.requirement[indexPath.row] else { return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobDetailsCell") as! JobDetailsRequirementTableViewCell
        
        cell.setCell(requirement: row)
        
        return cell
    }
    
    
}
