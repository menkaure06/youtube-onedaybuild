//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Nadario Ferguson on 8/2/20.
//  Copyright © 2020 Nadario Ferguson. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUG3Qz3Q1VfL3AVxBEq_BNlQ"
    static var API_URL =
    "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}
