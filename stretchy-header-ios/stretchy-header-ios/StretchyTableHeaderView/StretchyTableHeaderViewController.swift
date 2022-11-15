//
//  StretchyTableHeaderViewController.swift
//  stretchy-header-ios
//
//  Created by Chhan Sophearith on 15/11/22.
//

import UIKit

class StretchyTableHeaderViewController: UIViewController {
    
    private let cellId = "StretchyTableHeaderViewController"

    private let tableView: UITableView = {
        let tbl = UITableView()
        return tbl
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    let titles = [
        "apple", "book","cat", "dog", "eye",
        "apple", "book","cat", "dog", "eye",
        "apple", "book","cat", "dog", "eye",
        "apple", "book","cat", "dog", "eye",
        "apple", "book","cat", "dog", "eye",
        "apple", "book","cat", "dog", "eye",
        "apple", "book","cat", "dog", "eye"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    let backButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 20
        btn.isUserInteractionEnabled = true
        btn.setImage(UIImage(named: "back-arrow"), for: .normal)
        return btn
    }()
    
    func setupView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.frame = view.bounds
        let header = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.imageView.image = UIImage(named: "bg")
        tableView.tableHeaderView = header
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        backButton.addTarget(self, action: #selector(tapBack), for: .touchUpInside)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
        }
        header.scrollViewDidScroll(scrollView: scrollView)
    }

    @objc func tapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension StretchyTableHeaderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        return cell
    }
}
