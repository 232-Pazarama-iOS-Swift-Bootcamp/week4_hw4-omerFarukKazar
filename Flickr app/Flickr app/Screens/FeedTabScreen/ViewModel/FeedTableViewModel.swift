//
//  FeedListViewModel.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 19.10.2022.
//

import Foundation
import Moya
import FirebaseFirestore

enum RecentsFeedChanges {
    case didErrorOccurred(_ error: Error)
    case didFetchPhotos
}

final class FeedTableViewModel {
    private var photosResponse: PhotosResponse? {
        didSet {
            self.changeHandler?(.didFetchPhotos)
        }
    }
    
    private let db = Firestore.firestore()
    
    var changeHandler: ((RecentsFeedChanges) -> Void)?
    
    var numberOfRows: Int {
        photosResponse?.photos?.count ?? 0
    }
    
    func fetchPhotos() {
        provider.request(.getRecentPhotos) { result in
            switch result {
            case .failure(let error):
                self.changeHandler?(.didErrorOccurred(error))
            case .success(let response):
                do {
                    let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: response.data)
                    
                    self.addPhotosToFirebaseFirestore(photosResponse.photos)
                    
                    self.photosResponse = photosResponse
                    self.changeHandler?(.didFetchPhotos)
                } catch {
                    self.changeHandler?(.didErrorOccurred(error))
                }
            }
        }
    }
    
    private func addPhotosToFirebaseFirestore(_ photos: [Photo]?) {
        guard let photos = photos else {
            return
        }
        photos.forEach { photo in
            do {
                guard let data = try photo.dictionary, let id = photo.id else {
                    return
                }
                
                db.collection("photos").document(id).setData(data) { error in
                    
                    if let error = error {
                        self.changeHandler?(.didErrorOccurred(error))
                    }
                }
            } catch {
                self.changeHandler?(.didErrorOccurred(error))
            }
        }
    }
    
    func photoForIndexPath(_ indexPath: IndexPath) -> Photo? {
        photosResponse?.photos?[indexPath.row]
    }
}
