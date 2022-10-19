//
//  FeedTabViewController.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 17.10.2022.
//

import UIKit
import Kingfisher

class FeedTabViewController: FAViewController {
    
    private var viewModel: FeedTableViewModel

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Init
    init(viewModel: FeedTableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        viewModel.fetchPhotos()
        
        viewModel.changeHandler = { change in
            switch change {
            case .didFetchPhotos:
                self.tableView.reloadData()
            case .didErrorOccurred(let error):
                self.showError(error)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = self.title
        tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        tabBarController?.navigationItem.hidesBackButton = true
    }
    

    
}

// MARK: - UITableViewDelegate
extension FeedTabViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension FeedTabViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell else {
            fatalError("FeedTableViewCell not found.")
        }
        guard let photo = viewModel.photoForIndexPath(indexPath) else {
            fatalError("photo not found.")
        }
        
        cell.usernameLabel.text = photo.ownername
//        cell.photoImageView = photo.
        cell.photoImageView.kf.setImage(with: photo.photoURL) { _ in
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }

        return cell
    }


    
    
}


