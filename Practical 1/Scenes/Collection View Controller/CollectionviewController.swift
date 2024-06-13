//
//  CollectionviewController.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import SnapKit

class CollectionViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .white
        view.register(UserCell.self, forCellWithReuseIdentifier: "UserCell")
        return view
    }()
    
    let personInfo = UserProfile.sampleData()

    override func viewDidLoad() {
        super.viewDidLoad()
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
        return personInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as? UserCell else {
                fatalError("Unable to dequeue UserProfileCell")
            }
            let profile = personInfo[indexPath.item]
            cell.configure(with: profile)
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectVc = CollectionViewController()
        navigationController?.present(selectVc, animated: false)
    }
}
