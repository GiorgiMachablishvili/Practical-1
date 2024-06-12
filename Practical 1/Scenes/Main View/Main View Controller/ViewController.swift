//
//  ViewController.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var tableview:  UITableView = {
        let view = UITableView(frame: .zero)
        view.backgroundColor = UIColor.clear
        view.delegate = self
        view.dataSource = self
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    var userProfiles = UserProfile.sampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupConstraints()
        cellRegistration()
    }
    
    func cellRegistration() {
        tableview.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    func setup() {
        view.addSubview(tableview)
    }
    
    func setupConstraints() {
        tableview.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let profile = userProfiles[indexPath.row]
        cell.configuration(with: profile)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CollectionViewController()
        navigationController?.present(vc, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}


