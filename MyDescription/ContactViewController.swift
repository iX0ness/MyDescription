//
//  ContactViewController.swift
//  MyDescription
//
//  Created by Levchuk Misha on 03.05.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBAction func fbLink(_ sender: AnyObject) {
        if let url = NSURL(string: "https://www.facebook.com/misha.levchuk.1") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    @IBAction func vkLink(_ sender: Any) {
        if let url = NSURL(string: "https://vk.com/id18167188") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    @IBAction func twLink(_ sender: Any) {
        if let url = NSURL(string: "https://twitter.com/iX0ness") {
            UIApplication.shared.openURL(url as URL)
        }
    }
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
