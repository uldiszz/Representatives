//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Uldis Zingis on 10/10/16.
//  Copyright © 2016 Uldis Zingis. All rights reserved.
//

import Foundation

class RepresentativeController {
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepsByState(searchParameter: String, completion: @escaping (([Representative]) -> Void)) {
        guard let url = self.baseURL else { fatalError("URL obtional is nil") }
        let parameters = ["output": "json", "state": searchParameter]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: parameters) { (data, error) in
            // Make sure there is data
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else {
                NSLog("No data returned form request")
                completion([])
                return
            }
            
            // Turn the data into JSON
            // Parse through the dictionary to find where the dictionary version of your model objects are
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let representativesDict = responseDictionary["results"] as? [[String: String]] else {
                    NSLog("Unable to serialize json. \nResponse: \(responseDataString)")
                    completion([])
                    return
            }
            
            // Turn the JSON into model object ([Card])
            let representativesObjects = representativesDict.flatMap { Representative(jsonDictionary: $0) }
            
            // Complete with the model objects
            completion(representativesObjects)
        }
    }
}
