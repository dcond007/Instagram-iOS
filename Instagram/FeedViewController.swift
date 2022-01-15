//
//  FeedViewController.swift
//  Instagram
//
//  Created by Astronaut Elvis on 1/14/22.
//

import UIKit
import Parse
import Toast_Swift

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let username: String = PFUser.current()?.username ?? "Instagram User"
        self.view.makeToast("Welcome " + username + "!", duration: 2.0, position: .center)
        // Do any additional setup after loading the view.
    }
    

}
