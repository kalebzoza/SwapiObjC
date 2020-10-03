//
//  KCPersonArrayTableViewController.swift
//  SwapiObjC
//
//  Created by Kaleb  Carrizoza on 10/1/20.
//

import UIKit

class KCPersonArrayTableViewController: UITableViewController {
    
    //MARK: -Property
    var persons: [KCPerson] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPersonArray()
    }
    

    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.name

        return cell
    }
    
    func fetchPersonArray() {
        KCPersonController.fetchPersonArray { (persons, _) in
            DispatchQueue.main.async {
                self.persons = persons
                    self.tableView.reloadData()
            }
        }
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPerson" {
            guard let index = tableView.indexPathForSelectedRow, let destination = segue.destination as? KCPersonViewController else { return }
            let personToSend = persons[index.row]
            destination.person = personToSend
        }
    }
}//end of class

