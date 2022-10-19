//
//  Photo.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 19.10.2022.
//

import Foundation

struct Photo : Codable {
    
    var id: String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var ispublic: Int?
    var isfriend: Int?
    var isfamily: Int?
    var ownername: String?
    var url_c: String?
    var height_c: Int?
    var width_c: Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case owner = "owner"
        case secret = "secret"
        case server = "server"
        case farm = "farm"
        case title = "title"
        case ispublic = "ispublic"
        case isfriend = "isfriend"
        case isfamily = "isfamily"
        case ownername = "ownername"
        case url_c = "url_c"
        case height_c = "height_c"
        case width_c = "width_c"
    }
}

extension Photo {
    var photoURL: URL {
        guard let url_c = url_c,
              let photoUrl = URL(string: url_c) else {
            fatalError("photo url not found.")
        }
        return photoUrl
    }


}

extension Photo {
    init(from dict: [String: Any]) {
        id = dict["id"] as? String
        owner = dict["owner"] as? String
        secret = dict["secret"] as? String
        server = dict["server"] as? String
        farm = dict["farm"] as? Int
        title = dict["title"] as? String
        ispublic = dict["ispublic"] as? Int
        isfriend = dict["isfriend"] as? Int
        isfamily = dict["isfamily"] as? Int
        ownername = dict["ownername"] as? String
        url_c = dict["url_c"] as? String
        height_c = dict["height_c"] as? Int
        width_c = dict["width_c"] as? Int

    }
}

