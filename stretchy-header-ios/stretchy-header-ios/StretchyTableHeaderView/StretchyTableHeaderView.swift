//
//  StretchyTableHeaderView.swift
//  stretchy-header-ios
//
//  Created by Chhan Sophearith on 15/11/22.
//

import Foundation
import UIKit

class StretchyTableHeaderView: UIView {
    
    public let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewButtom = NSLayoutConstraint()
    private var containerViewHeight = NSLayoutConstraint()
    private var containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createViews()
        self.setViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createViews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
    }
    
    func setViewConstraints() {
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewButtom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewButtom.isActive = true
        
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }
    
    // view scroll change from container
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewButtom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
