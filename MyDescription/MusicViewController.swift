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
    @IBOutlet weak var queenWebView: UIWebView!
    @IBOutlet weak var acdcWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            getVideo1(videoCode: "TXXO9_3gb3o")
            getVideo2(videoCode: "jixYwUuW5U0")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getVideo1(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        acdcWebView.loadRequest(URLRequest(url: url!))
    }
    func getVideo2(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        queenWebView.loadRequest(URLRequest(url: url!))
    }

}
