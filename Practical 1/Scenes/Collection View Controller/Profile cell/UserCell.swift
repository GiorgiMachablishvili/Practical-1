//
//  UserCell.swift
//  Practical 1
//
//  Created by Gio's Mac on 13.06.24.
//

import UIKit
import SnapKit
import Kingfisher

class UserCell: UICollectionViewCell {
    private lazy var personNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()
    
    private lazy var personAgeLabel: UILabel = {
        let view = UILabel(frame: .zero)

        return view
    }()
    
    private lazy var profilePictureLabel: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(personNameLabel)
        addSubview(personAgeLabel)
        addSubview(profilePictureLabel)
    }
    
    func setupConstrains() {
        profilePictureLabel.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(20)
            make.leading.equalTo(snp.leading).offset(30)
            make.width.height.equalTo(100)
        }
        
        personNameLabel.snp.remakeConstraints { make in
            make.bottom.equalTo(profilePictureLabel.snp.centerY)
            make.leading.equalTo(profilePictureLabel.snp.trailing).offset(20)
            make.top.equalTo(profilePictureLabel.snp.top)
        }
        
        personAgeLabel.snp.remakeConstraints { make in
            make.leading.equalTo(profilePictureLabel.snp.trailing).offset(20)
            make.top.equalTo(personNameLabel.snp.bottom)
        }
    }
    
    func configure(with data: UserProfile) {
        personNameLabel.text = data.name
        personAgeLabel.text = data.age
        let url = URL(string: data.profilePictureURL)
        profilePictureLabel.kf.setImage(with: url)
        
    }
}

