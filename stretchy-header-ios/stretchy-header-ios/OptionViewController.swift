//
//  ViewController.swift
//  stretchy-header-ios
//
//  Created by Chhan Sophearith on 15/11/22.
//

import UIKit

class OptionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Option"
    }
    
    @IBAction func tapStretchyTableHeaderView() {
        let vc = StretchyTableHeaderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapStretchHeaderView() {
        let vc = StretchyHeaderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

