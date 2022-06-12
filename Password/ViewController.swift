//
//  ViewController.swift
//  Password
//
//  Created by TheGIZzz on 9/6/2565 BE.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextField = PasswordTextFieldView(placeHolderText: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextFieldView(placeHolderText: "Re-enter new password")
    
    let stackView = UIStackView()
    
    let resetButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }

}

extension ViewController {
    
    func setup() {
        setupDismissKeyboardGesture()
    }
    
    private func setupDismissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func style() {
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        newPasswordTextField.delegate = self

        statusView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.layer.cornerRadius = 5
        stackView.clipsToBounds = true
        
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.configuration = .filled()
        resetButton.setTitle("Reset Password", for: [])
    }
    
    func layout() {
        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        
        view.addSubview(stackView)
        
        // newPasswordTextField
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension ViewController: PasswordTextFieldDelegate {
    func editingChange(_ sender: PasswordTextFieldView) {
        if sender === newPasswordTextField {
            print("check : \(sender.textField.text)")
            statusView.updateDisplay(sender.textField.text ?? "")
        }
    }
    
    func editDidEnd(_ sender: PasswordTextFieldView) {
        print("editDidEnd: \(sender.textField.text)")
    }
    
}
