//
//  ChatDetailViewController.swift
//  Mockup
//
//  Created by Jesse Joseph on 19/04/19.
//  Copyright © 2019 Jesse Joseph. All rights reserved.
//

import UIKit

class ChatDetailViewController: UIViewController {

    var chatPerson:PersonToChat?
    var personName:String?
    @IBOutlet weak var chatPersonNameTitle: UINavigationItem!
    
    override func viewDidLoad() {
//        navigationController!.popViewController(animated: true)
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        if let chatPersonName = chatPerson?.name{
            navigationItem.title = chatPersonName
        }else{
            navigationItem.title = personName
        }
    }
    
}
