//
//  ControllersVideoCallView.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 13/02/24.
//

import Foundation
import UIKit

class ControllersVideoCallView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    lazy var contentView: UIView = {
       let contentview = UIView()
        contentview.backgroundColor = .black
        contentview.layer.cornerRadius = 22
        contentview.layer.masksToBounds = true
        contentview.translatesAutoresizingMaskIntoConstraints = false
        return contentview
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = UIColor.cyan
        addSubview(contentView)
        contentViewConstraints()
    }
    
    private func contentViewConstraints() {
        NSLayoutConstraint.activate(
            [
                contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100.0),
                contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
                contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
                contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20.0),
                contentView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -800.0)
            ]
        )
    }
}
