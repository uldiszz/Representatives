//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var FirstLeftLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var ThirdLeftLabel: UILabel!
    
    @IBOutlet weak var FirstRightLabel: UILabel!
    @IBOutlet weak var SecondRightLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    
    var representative: Representative?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateWithRepresentative() {
        guard let representative = self.representative else { return }
        
        FirstLeftLabel.text = representative.name
        phoneButton.setTitle(representative.phone, for: .normal)
        ThirdLeftLabel.text = "Office: " + representative.office
        
        FirstRightLabel.text = "Party: " + representative.party
        SecondRightLabel.text = "State: " + representative.state
        urlButton.setTitle(representative.link, for: .normal)
    }
    
    @IBAction func phoneTapped(_ sender: AnyObject) {
        guard let representative = self.representative else { return }
        if let url = URL(string: "tel://\(representative.phone)"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func urlButtonTapped(_ sender: AnyObject) {
        guard let representative = self.representative else { return }
        if let url = URL(string: representative.link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
