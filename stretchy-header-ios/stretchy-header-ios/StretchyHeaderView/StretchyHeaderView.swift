//
//  StretchyHeaderView.swift
//  stretchy-header-ios
//
//  Created by Chhan Sophearith on 15/11/22.
//

import Foundation
import UIKit

class StretchyHeaderView: UIView {
    
    var imageView: UIImageView!
    var colorView: UIView!
    var bgColor = UIColor.purple
    var titleLabel = UILabel()
    var articleIcon: UIImageView!
    
    init(frame:CGRect,title: String) {
        self.titleLabel.text = title.uppercased()
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = .white
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        
        let constraints:[NSLayoutConstraint] = [
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            colorView.topAnchor.constraint(equalTo: self.topAnchor),
            colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        imageView.image = UIImage(named: "bg")
        imageView.contentMode = .scaleAspectFill
        
        colorView.backgroundColor = bgColor
        colorView.alpha = 0.6
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        
        let titlesConstraints: [NSLayoutConstraint] = [
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        ]
        NSLayoutConstraint.activate(titlesConstraints)
        
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        titleLabel.text = "Sketchy"
        
        articleIcon = UIImageView()
        articleIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(articleIcon)
        
        let imageConstraints:[NSLayoutConstraint] = [
            articleIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            articleIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 6),
            articleIcon.widthAnchor.constraint(equalToConstant: 40),
            articleIcon.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(imageConstraints)
        articleIcon.image = UIImage(named: "articles")
        
    }
    
    func decrementColorAlpha(offset: CGFloat) {
        if self.colorView.alpha <= 1 {
            let alphaOffset = (offset/500)/85
            self.colorView.alpha += alphaOffset
        }
    }
    
    func decrementArticleAlpha(offset: CGFloat) {
        if self.articleIcon.alpha >= 0 {
            let alphaOffset = max((offset - 65)/85.0, 0)
            self.articleIcon.alpha = alphaOffset
        }
    }
    
    func incrementColorAlpha(offset: CGFloat) {
        if self.colorView.alpha >= 0.6 {
            let alphaOffset = (offset/200)/85
            self.colorView.alpha -= alphaOffset
        }
    }
    
    func incrementArticleAlpha(offset: CGFloat) {
        if self.articleIcon.alpha <= 1 {
            let alphaOffset = max((offset - 65)/85, 0)
            self.articleIcon.alpha = alphaOffset
        }
    }
}
