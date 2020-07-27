//
//  Response.swift
//  Youtube-OneDayBuild
//
//  Created by Linh Tuan on 7/23/20.
//  Copyright © 2020 Linh Tuan. All rights reserved.
//

import Foundation


struct Response: Decodable {
    
    var items:[Videos]?
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init (from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Videos].self, forKey: .items)
    }
}
