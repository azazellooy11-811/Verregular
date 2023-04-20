//
//  HomeViewController.swift
//  Verregular
//
//  Created by Азалия Халилова on 18.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Verregular".uppercased()
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstButton: UIButton = {
    let button = UIButton()
        button.setTitle("Select verbs".localized, for: .normal)
        button.backgroundColor = .systemCyan
        button.setTitleColor(.darkText, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToSelectVerbsViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondButton: UIButton = {
    let button = UIButton()
        button.setTitle("Train verbs".localized, for: .normal)
        button.backgroundColor = .systemCyan
        button.setTitleColor(.darkText, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToTrainVerbsViewController), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    
    private let cornerRadius: CGFloat = 10
    private let buttonHeight: CGFloat = 80
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

// MARK: - Private methods
    @objc
    private func goToSelectVerbsViewController() {
        navigationController?.pushViewController(SelectVerbsViewController(), animated: true)
    }
    
    @objc
    private func goToTrainVerbsViewController() {
        navigationController?.pushViewController(TrainVerbsViewController(), animated: true)
    }
    
    private func configureUI() {
        view.addSubview(titleLabel)
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -80).isActive = true
        
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 40).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        secondButton.widthAnchor.constraint(equalTo: firstButton.widthAnchor).isActive = true
    }
}

