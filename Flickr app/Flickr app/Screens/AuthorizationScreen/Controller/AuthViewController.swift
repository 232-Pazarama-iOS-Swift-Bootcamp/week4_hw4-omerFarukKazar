//
//  AuthViewController.swift
//  Flickr app
//
//  Created by Ömer Faruk Kazar on 16.10.2022.
//

import UIKit

class AuthViewController: FAViewController {
    
    private let viewModel: AuthViewModel
    
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
        viewModel.changeHandler = { change in
            switch change {
            case .didErrorOccurred(let error):
//                self.showError(error)
                print(error)
            case .didSignUpSuccessful:
//                self.showAlert(title: "SIGN UP SUCCESSFUL!")
                print("sign up successful")
            }
            self.title = "Authorization"
            // Do any additional setup after loading the view.
        }
    }
        
        override func viewWillAppear(_ animated: Bool) {
            tabBarController?.title = "Auth"
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            //        tabBarController?.navigationItem.hidesBackButton = true
        }
        
        // MARK: - Init
        init(viewModel: AuthViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        
        
        @IBAction private func didChangeSegment(_ sender: UISegmentedControl) {
            let title = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
            authType = AuthType(text: title ?? "Sign In")
        }
        
        @IBAction private func logInButtonTapped(_ sender: UIButton) {
            
            guard let credential = credentialsTextField.text,
                  let password = passwordTextField.text else {
                return
            }
            
            switch authType {
            case .signIn:
                viewModel.signIn(email: credential,
                                 password: password,
                                 completion: { [weak self] in
                    guard let self = self else { return }
                    let tabBarVC = TabBarViewController()
                    tabBarVC.modalPresentationStyle = .fullScreen
                    self.navigationController?.pushViewController(tabBarVC, animated: true)
                })
            case .signUp:
                viewModel.signUp(email: credential,
                                 password: password)
            }
            

        }
        
    }
