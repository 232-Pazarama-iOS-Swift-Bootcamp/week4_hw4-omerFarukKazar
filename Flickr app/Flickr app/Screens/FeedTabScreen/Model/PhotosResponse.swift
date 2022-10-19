//
//  PhotosResponse.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 19.10.2022.
//

import Foundation

struct PhotosResponse: Decodable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: Int?
    var stat: String?
    var photos: [Photo]?
}
