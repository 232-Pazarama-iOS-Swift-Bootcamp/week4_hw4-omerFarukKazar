//
//  FeedTabViewController.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 17.10.2022.
//

import UIKit

class FeedTabViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
    }
    
    
    
}

// MARK: - UITableViewDelegate
extension FeedTabViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension FeedTabViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell else {
            fatalError("FeedTableViewCell not found.")
        }
        
//        cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
//        cell.backgroundColor = .systemBlue
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
}


