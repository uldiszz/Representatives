//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        cell.textLabel?.text = States.all[indexPath.row]
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStateDetailView" {
            guard let nextVC = segue.destination as? StateDetailTableViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            nextVC.state = States.all[indexPath.row]
        }
    }
}
