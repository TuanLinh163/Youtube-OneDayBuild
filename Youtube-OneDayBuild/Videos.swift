//
//  Videos.swift
//  Youtube-OneDayBuild
//
//  Created by Linh Tuan on 7/23/20.
//  Copyright © 2020 Linh Tuan. All rights reserved.
//

import Foundation


struct Videos : Decodable  {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case thumbnail = "url"
        case description
        case videoId
    }
    
    init(from decoder : Decoder) throws {
        
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
            
            // parse title
            self.title = try snippetContainer.decode(String.self, forKey: .title)
            
            // parse description
            self.description = try snippetContainer.decode(String.self, forKey: .description)
            
            // parse published date
            self.published = try snippetContainer.decode(Date.self, forKey: .published)
            
            // parse thumbnail
            let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
            let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
            self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
            
            // parse video ID
            let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
            self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
            
            
        } catch {
            print("Error")
        }
        
    }
}
