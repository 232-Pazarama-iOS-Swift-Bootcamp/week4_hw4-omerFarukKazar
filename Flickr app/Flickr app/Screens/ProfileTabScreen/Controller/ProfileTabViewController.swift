//
//  ProfileTabViewController.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 18.10.2022.
//

import UIKit

final class ProfileTabViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var likedPhotosButton: UIButton!
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var userProfilePhoto: UIImageView!
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))

                // add it to the image view;
        userProfilePhoto.addGestureRecognizer(tapGesture)
                // make sure imageView can be interacted with by user
        userProfilePhoto.isUserInteractionEnabled = true
        

    }

    @objc func imageTapped(gesture: UIGestureRecognizer) {
           // if the tapped view is a UIImageView then set it to imageview
           if (gesture.view as? UIImageView) != nil {
               print("Image Tapped")
               //Here you can initiate your new ViewController

           }
       }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = self.title
        tabBarController?.navigationItem.hidesBackButton = true
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOutTapped))
        
    }
    

    @objc func signOutTapped() {
        print("Tapped")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func imageClicked(_ sender: Any) {
        
    }
    @IBAction func likedPhotosButtonTapped(_ sender: Any) {
        switch likedPhotosButton.currentImage {
        case UIImage(systemName: "heart"):
            likedPhotosButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        case UIImage(systemName: "heart.fill"):
            likedPhotosButton.setImage(UIImage(systemName: "heart"), for: .normal)
        default: likedPhotosButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func favoritesButtonTapped(_ sender: Any) {
        switch favoritesButton.currentImage {
        case UIImage(systemName: "bookmark"):
            favoritesButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        case UIImage(systemName: "bookmark.fill"):
            favoritesButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        default: favoritesButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
}

extension ProfileTabViewController: UICollectionViewDelegate {
    
    
}


extension ProfileTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
    
    
}
