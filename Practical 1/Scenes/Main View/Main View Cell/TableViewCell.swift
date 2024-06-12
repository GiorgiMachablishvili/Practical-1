//
//  TableViewCell.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import SnapKit
import Kingfisher

class TableViewCell: UITableViewCell {
  private lazy var avatarImage: UIImageView = {
    let view = UIImageView(frame: .zero)
    return view
  }()

  private lazy var titleLabel: UILabel = {
    let view = UILabel(frame: .zero)
    view.textColor = .purple
    return view
  }()

  private lazy var ageLabel: UILabel = {
    let view = UILabel(frame: .zero)
    view.textColor = .purple
    return view
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setup()
    setupConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(avatarImage)
    addSubview(titleLabel)
    addSubview(ageLabel)
  }

  private func setupConstraint() {
    avatarImage.snp.remakeConstraints { make in
        make.centerY.equalTo(snp.centerY)
        make.leading.equalTo(snp.leading).offset(30)
        make.width.height.equalTo(50)
        
    }

    titleLabel.snp.remakeConstraints { make in
      make.leading.equalTo(avatarImage.snp.trailing).offset(10)
      make.top.equalTo(avatarImage.snp.top)
    }

    ageLabel.snp.remakeConstraints { make in
      make.leading.equalTo(avatarImage.snp.trailing).offset(10)
      make.top.equalTo(titleLabel.snp.bottom)
    }
  }
    
    func configuration(with data: UserProfile) {
        if let url = URL(string: data.profilePictureURL) {
                    avatarImage.kf.setImage(with: url)
                }
        titleLabel.text = data.name
        ageLabel.text = data.age
    }
}
