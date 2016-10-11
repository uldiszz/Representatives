//
//  Representative.swift
//  Representatives
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import Foundation

class Representative {
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init(name: String, party: String, state: String, district: String, phone: String, office: String, link: String) {
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
    
    init?(jsonDictionary: [String: String]) {
        guard let name = jsonDictionary[kName],
             let party = jsonDictionary[kParty],
             let state = jsonDictionary[kState],
             let district = jsonDictionary[kDistrict],
             let phone = jsonDictionary[kPhone],
             let office = jsonDictionary[kOffice],
             let link = jsonDictionary[kLink] else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
}


