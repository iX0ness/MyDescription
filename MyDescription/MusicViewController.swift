//
//  MusicViewController.swift
//  MyDescription
//
//  Created by Levchuk Misha on 01.05.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
