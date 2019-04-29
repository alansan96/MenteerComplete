//
//  ConnectDetailsViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 18/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ConnectDetailsViewController: UIViewController {
    
    var detailPerson:OrdinaryHuman?
    var personJob:String?
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var detailPersonImage: UIImageView!
    @IBOutlet weak var personLocationLabel: UILabel!
    @IBOutlet weak var personJobLabel: UILabel!
    @IBOutlet weak var personInterestLabel: UILabel!
    
    
    override func viewDidLoad() {
        setUI()
        super.viewDidLoad()
    }
    
    func setUI(){
        personNameLabel.text = detailPerson?.name
        personInterestLabel.text = detailPerson?.interest
        detailPersonImage.image = detailPerson?.image
        personLocationLabel.text = detailPerson?.location
        if let detailPersonJob = detailPerson?.job{
            personJobLabel.text = detailPersonJob
        }else{
            personJobLabel.text = "Unemployed"
        }
    }

}
