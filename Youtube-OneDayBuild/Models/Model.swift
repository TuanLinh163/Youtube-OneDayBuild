//
//  Model.swift
//  Youtube-OneDayBuild
//
//  Created by Linh Tuan on 7/23/20.
//  Copyright © 2020 Linh Tuan. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos:[Videos])
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getVideos() {
        
        // create a url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // get s urlsession object
        let session = URLSession.shared
        
        // get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            do {
                // parsing data
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    // Call the "videosFetched" method of the delegate
                    self.delegate?.videosFetched(response.items!)
                }
                
                dump(response)
                
            } catch {
                
            }
        }
        
        // kick off data task
        dataTask.resume()
    }
    
}
