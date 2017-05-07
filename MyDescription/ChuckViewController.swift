//
//  ChuckViewController.swift
//  MyDescription
//
//  Created by Levchuk Misha on 04.05.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class ChuckViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var waitLabel: UILabel!
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        let url = URL(string: "https://api.chucknorris.io/jokes/random")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data {
                    do {
                        let myJSNON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(myJSNON)
                        
                        let joke = myJSNON["value"] as? String
                        
                        self.quoteLabel.text! = joke!
                        self.waitLabel.isHidden = true
                        
                    } catch {
                        
                    }
                }
            }
        }
        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
