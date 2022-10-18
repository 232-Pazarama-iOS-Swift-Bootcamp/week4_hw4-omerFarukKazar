//
//  FireBaseFireStoreAccessible.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 19.10.2022.
//


import Foundation
import FirebaseFirestore

protocol FireBaseFireStoreAccessible {}

extension FireBaseFireStoreAccessible {
    var db: Firestore {
        Firestore.firestore()
    }
}
