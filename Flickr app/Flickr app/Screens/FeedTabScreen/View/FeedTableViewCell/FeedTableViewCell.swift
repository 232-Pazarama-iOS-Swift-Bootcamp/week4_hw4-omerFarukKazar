//
//  TableViewCell.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 17.10.2022.
//

import UIKit

final class FeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoImageView.image = UIImage(named: "example")
        profilePhotoImageView.image = UIImage(named: "pp")
    }

    
    @IBAction func likeButtonTapped(_ sender: Any) {
        switch likeButton.currentImage {
        case UIImage(systemName: "heart"):
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        case UIImage(systemName: "heart.fill"):
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        default: likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    
    @IBAction func addToFavoritesButtonTapped(_ sender: Any) {
        switch addToFavoritesButton.currentImage {
        case UIImage(systemName: "bookmark"):
            addToFavoritesButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        case UIImage(systemName: "bookmark.fill"):
            addToFavoritesButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        default: addToFavoritesButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
}

