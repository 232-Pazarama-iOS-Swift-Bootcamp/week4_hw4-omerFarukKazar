//
//  AuthViewController.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 16.10.2022.
//

import UIKit

class AuthViewController: UIViewController {

    // MARK: - AuthTypeSettings
    enum AuthType: String {
        case signIn = "Sign In"
        case signUp = "Sign Up"
        
        init(text: String) {
            switch text {
            case "Sign In":
                self = .signIn
            case "Sign Up":
                self = .signUp
            default:
                self = .signIn
            }
        }
    }
    
    var authType: AuthType = .signIn {
        didSet {
            titleLabel.text = title
            confirmButton.setTitle(title, for: .normal)
        }
    }
    
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var credentialsTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Authorization"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.title = "Auth"
    }
    
    // MARK: - Init
//    init(viewModel: AuthViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    @IBAction private func didChangeSegment(_ sender: UISegmentedControl) {
        let title = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        authType = AuthType(text: title ?? "Sign In")
    }
    
    @IBAction private func logInButtonTapped(_ sender: UIButton) {

        let tabBarVC = TabBarViewController()
        tabBarVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(tabBarVC, animated: true)
    }
    
}





