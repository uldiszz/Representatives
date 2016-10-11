//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityView: UIView!
    @IBOutlet weak var noRepresentativesView: UIView!
    
    var state: String?
    var representatives: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = self.state else { return }
        
        DispatchQueue.main.async {
            RepresentativeController.searchRepsByState(searchParameter: state) { (representatives) in
                self.representatives = representatives
                self.tableView.reloadData()
                
                self.loadingIndicator.stopAnimating()
                self.activityView.removeFromSuperview()
                
                if self.representatives.isEmpty {
                    self.noRepresentativesView.isHidden = false
                }
                self.view.bringSubview(toFront: self.view)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }

        cell.representative = representatives[indexPath.row]
        cell.updateWithRepresentative()

        return cell
    }
}
