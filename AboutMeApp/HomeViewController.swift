//
//  HomeViewController.swift
//  AboutMeApp
//
//  Created by Chorrs on 7.10.23.
//

import UIKit

 class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = welcomeText
    }
    
    

}
