//
//  NavigationViewController.swift
//  Mockup
//
//  Created by Alan Santoso on 29/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {

    @IBOutlet weak var mentorView: UIView!
    
    @IBOutlet weak var menteeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
//        let longTitleLabel = UILabel()
//        longTitleLabel.text = "Chat"
//        longTitleLabel.font = UIFont(name: "Helvetica-Bold", size: 30)
//        longTitleLabel.sizeToFit()
//        
//        let leftItem = UIBarButtonItem(customView: longTitleLabel)
//        self.navigationItem.leftBarButtonItem = leftItem
    }

    

    @IBAction func segmentedAdded(_ sender: UISegmentedControl) {
        
        switch  sender.selectedSegmentIndex {
        case 0:
            mentorView.alpha=1
            menteeView.alpha = 0
            print(1)
        case 1:
            mentorView.alpha=0
            menteeView.alpha = 1
            print(2)

        default:
            print("error")
        }
    }
    
    
    
}
