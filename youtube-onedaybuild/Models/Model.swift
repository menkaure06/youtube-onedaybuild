//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Nadario Ferguson on 8/2/20.
//  Copyright © 2020 Nadario Ferguson. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate: ModelDelegate?
    
    func getVideos () {
        
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // Parsing the data into video objects
                let decorder = JSONDecoder()
                decorder.dateDecodingStrategy = .iso8601
                
                let response = try decorder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        
                        // Call the videosReturned method of the delegate
                        
                        self.delegate?.videosFetched(response.items!)
                        
                    }
                }
                
                // dump(response)
                
            }
            catch {
                
            }
            
            
        }
        // Kick off the task
        
        dataTask.resume()
    }
}
