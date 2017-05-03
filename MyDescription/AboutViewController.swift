//
//  AboutViewController.swift
//  MyDescription
//
//  Created by Levchuk Misha on 01.05.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    @IBAction func answer(_ sender: AnyObject) {
        if let answerWord = inputText.text {
            if answerWord == "egg" {
                createAlert(title: "Hmm... What I think about it ?", messageText: "I agree with you dude!")
            } else if answerWord == "chicken" {
                createAlert(title: "Hmm... What I think about it ?", messageText: "I don't think so")
            } else {
                createAlert(title: "You're not in the subject", messageText: "Read question again and try to answer")
            }
        }
    }
    
    
    
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func createAlert (title: String, messageText: String) {
        let alert = UIAlertController(title: title, message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}
