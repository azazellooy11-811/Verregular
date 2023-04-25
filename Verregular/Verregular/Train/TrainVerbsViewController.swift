//
//  TrainVerbsViewController.swift
//  Verregular
//
//  Created by Азалия Халилова on 20.04.2023.
//

import UIKit
import SnapKit

final class TrainVerbsViewController: UIViewController {
    
    // MARK: - GUI Variables
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var infinitiveLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var pastSimpleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Past Simple"
        
        return label
    }()
    
    private lazy var participleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Past Participle"
        
        return label
    }()
    
    private lazy var pastSimpleTextField: UITextField = {
       let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var participleTextField: UITextField = {
       let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .gray
        button.setTitle("Check".localized, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,
                         action:
                            #selector(checkAction),
                         for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Properties
    private let edgeInsets = 30
    private var dataSource = IrregularVerbs.shared.selectedVerbs
    private var currentVerb: Verb? {
        guard dataSource.count > count else { return nil }
        return dataSource[count]
    }
    private var count = 0 {
        didSet {
            infinitiveLabel.text = currentVerb?.infinitive
            pastSimpleTextField.text = ""
            participleTextField.text = ""
            checkButton.setTitle("Check", for: .normal)
            checkButton.backgroundColor = .gray
        }
    }
    
    private var score = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Train verbs".localized
        setupUI()
        
        hideKeyboardWhenTappedAround()
        
        if dataSource.isEmpty {
            dataSource = IrregularVerbs.shared.verbs
        }
        infinitiveLabel.text = dataSource.first?.infinitive
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForKeyboardNotification()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        unregisterForKeyboardNotification()
    }
    
    // MARK: - Private methods
    @objc
    private func checkAction() {
        if checkAnswers() {
            score += 1
            if currentVerb?.infinitive == dataSource.last?.infinitive {
                let alert = UIAlertController(title: "Congratulations!".localized, message: "You answered \(score) verbs correctly".localized, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { _ in
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(action)
                present(alert, animated: true)
            } else {
                count += 1
            }
        } else {
            checkButton.backgroundColor = .red
            checkButton.setTitle("Try again", for: .normal)
        }
    }
    
    private func checkAnswers() -> Bool {
        pastSimpleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        == currentVerb?.pastSimple.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() &&
        participleTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        == currentVerb?.participle.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([infinitiveLabel,
                                 pastSimpleLabel,
                                 pastSimpleTextField,
                                 participleLabel,
                                 participleTextField,
                                 checkButton])
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        infinitiveLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        pastSimpleLabel.snp.makeConstraints { make in
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(60)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        pastSimpleTextField.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleLabel.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleTextField.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        participleTextField.snp.makeConstraints { make in
            make.top.equalTo(participleLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(participleTextField.snp.bottom).offset(100)
            make.trailing.leading.equalToSuperview().inset(edgeInsets)
        }
    }
}

// MARK: - UITextFieldDelegate
extension TrainVerbsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if pastSimpleTextField.isFirstResponder {
            participleTextField.becomeFirstResponder()
        } else {
            scrollView.endEditing(true)
        }
        
        return true
    }
}

// MARK: - Keyboard events
private extension TrainVerbsViewController{
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func unregisterForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc
    func keyboardWillShow(_ notification: Notification) {
        guard let frame =
                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                as? CGRect  else { return }
        
        scrollView.contentInset.bottom = frame.height + 50
    }
    
    @objc
    func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero - 50
    }
    
    func hideKeyboardWhenTappedAround() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(recognizer)
    }
    
    @objc
    func hideKeyboard() {
        scrollView.endEditing(true)
    }
}
