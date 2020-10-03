//
//  KCPersonViewController.swift
//  SwapiObjC
//
//  Created by Kaleb  Carrizoza on 10/1/20.
//

import UIKit

class KCPersonViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    

    //MARK: - Properties
    var person: KCPerson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    
    }
    
    //MARK: - Helper
    func updateViews() {
        if let person = person {
            
        nameLabel.text = person.name
        genderLabel.text = person.gender
        heightLabel.text = "Height: \(person.height)inches"
         }
    }
}//end of class
