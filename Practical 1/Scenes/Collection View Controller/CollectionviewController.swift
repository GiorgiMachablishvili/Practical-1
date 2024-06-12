//
//  CollectionviewController.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import SnapKit

class CollectionViewController: UIViewController  {
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    var delegate: UserProfile?
    
    let userData = [UserProfile
        .init(name: "Giorgi", age: "24", profilePictureURL: "https://img.freepik.com/premium-vector/young-smiling-man-avatar-man-with-brown-beard-mustache-hair-wearing-yellow-sweater-sweatshirt-3d-vector-people-character-illustration-cartoon-minimal-style_365941-860.jpg"),
        .init(name: "Ana", age: "22", profilePictureURL: "https://static.vecteezy.com/system/resources/thumbnails/001/993/889/small/beautiful-latin-woman-avatar-character-icon-free-vector.jpg"),
        .init(name: "Irakli", age: "23", profilePictureURL: "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let layout = UICollectionViewFlowLayout()
//        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        setup()
        setupConstraints()
    }
    
    func setup() {
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectInfo = userData[indexPath.row]
        let selectVc = CollectionViewController()
        selectVc.modalPresentationStyle = .fullScreen
        selectVc.delegate = selectInfo
        
        navigationController?.pushViewController(selectVc, animated: false)
    }
}

