//
//  SearchTabViewController.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 17.10.2022.
//

import UIKit

class SearchTabViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    //MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = self.title
        tabBarController?.navigationItem.rightBarButtonItem?.isHidden = true
        tabBarController?.navigationItem.hidesBackButton = true
    }
    
    

//    @IBAction func doneButtonTapped(_ sender: Any) {
//
//    }
}

//extension SearchTabViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
//        print(text)
//    }
//}

extension SearchTabViewController: UICollectionViewDelegate {
    
}

extension SearchTabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}

extension SearchTabViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard searchController.isActive else {return}
        if let t = searchController.searchBar.text, !t.isEmpty {
            print("You are searching for", t)
        }
    }
    
    
}

