//
//  ContactViewController.swift
//  MyDescription
//
//  Created by Levchuk Misha on 03.05.17.
//  Copyright © 2017 Levchuk Misha. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, MFMailComposeViewControllerDelegate {

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
    @IBAction func sendEmail(_ sender: AnyObject) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        } else {
            showMailError()
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
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        
        mailComposerVC.setToRecipients(["mykhaylo.levchuk@ukr.net"])
        mailComposerVC.setSubject("Hello")
        mailComposerVC.setMessageBody("How are you doing", isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
    let sendMailErrorAlert = UIAlertController(title: "Could not send e-mail", message: "Your device could not send e-mail", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    

}
