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

  private lazy var primarybutton: UIButton = {
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
  }

  private func setup() {
    view.addSubview(textField)
    view.addSubview(primarybutton)
  }
    
    func cellsRegistration() {
        
    }

  private func setupConstraint() {
    textField.snp.remakeConstraints { make in
      make.top.equalToSuperview().offset(100.0)
      make.leading.equalToSuperview().offset(24)
      make.trailing.equalToSuperview().offset(-24)
    }

    username.snp.remakeConstraints { make in
      make.top.equalTo(textField.snp.bottom).offset(30)
      make.leading.equalToSuperview().offset(30)
      make.trailing.equalToSuperview().offset(-30)
    }

    primarybutton.snp.remakeConstraints { make in
      make.bottom.equalToSuperview().offset(-44)
      make.leading.trailing.equalToSuperview().offset(30)
      make.height.equalTo(50)
    }
  }
}
