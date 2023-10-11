//
//  ResumeViewController.swift
//  AboutMeApp
//
//  Created by Chorrs on 11.10.23.
//

import UIKit

class PersonInfoViewController: UIViewController {
    
    @IBOutlet weak var imageOfPerson: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var personSurname: UILabel!
    
    @IBOutlet weak var typesOfArt: UILabel!
    
    @IBOutlet weak var styles: UILabel!
    
    @IBOutlet weak var plots: UILabel!
    
    @IBOutlet weak var quote: UITextView!
    
   var personInPersonInfoVC: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personName.text = personInPersonInfoVC.person.name
        personSurname.text = personInPersonInfoVC.person.surname
        typesOfArt.text = personInPersonInfoVC.person.typesOfArt
        styles.text = personInPersonInfoVC.person.styles
        plots.text = personInPersonInfoVC.person.plots
        quote.text = personInPersonInfoVC.person.quote
    }
    
}
