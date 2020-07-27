//
//  Constants.swift
//  Youtube-OneDayBuild
//
//  Created by Linh Tuan on 7/23/20.
//  Copyright © 2020 Linh Tuan. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyBy2je3PTibWcn-pQ1jFqDMjCQ1gLxXjLk"
    static var PLAYLIST_ID = "UUL19dahMH6qwXxGXFWAjdVA"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
