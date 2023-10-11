//
//  BioViewController.swift
//  AboutMeApp
//
//  Created by Chorrs on 11.10.23.
//

import UIKit

class BiographyViewController: UIViewController {

    @IBOutlet weak var biography: UITextView!
    
    var userInBiographyViewController: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        biography.text = userInBiographyViewController.person.biography

    }

}
