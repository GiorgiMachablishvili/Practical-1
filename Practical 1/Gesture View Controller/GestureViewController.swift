//
//  GestureViewController.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import SnapKit

class GestureViewController: UIViewController {
    private lazy var textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = .systemGray5
        view.placeholder = "Enter your name"
        return view
    }()
    
    private lazy var primaryButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .yellow
        view.setTitle("Submit", for: .normal)
        view.isUserInteractionEnabled = false
        view.titleLabel?.textColor = .red
        return view
    }()
    
    private lazy var username: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .green
        return view
    }()
    
    var userProfiles = UserProfile.sampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupConstraint()
    }
    
    private func setup() {
        view.addSubview(textField)
        view.addSubview(primaryButton)
        view.addSubview(username)
    }
    
    private func setupConstraint() {
        textField.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100.0)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
        }
        
        username.snp.remakeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
        }
        
        primaryButton.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-44)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
}
