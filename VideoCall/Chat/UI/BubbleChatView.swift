//
//  BubbleChatView.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 16/02/24.
//

import Foundation
import UIKit

class BubbleChatView: UIView {
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
//        label.text = "Hola a todos los terricolas dsjfhdjsfhkjsdhfkdshfskjfhskjfkjhkjhjkhjkhjkhhkjhkjhhhhhhhjjhkhjhhdsjfhdjsfhkjsdhfkdshfskjfhskjfkjhkjhjkhjkhjkhhkjhkjhhhhhhhjjhkhjhh"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textAlignment: NSTextAlignment = .left {
        didSet {
            messageLabel.textAlignment = textAlignment
        }
    }
    
    var textMessage: String = "" {
        didSet {
            messageLabel.text = textMessage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 14
        layer.masksToBounds = true
        //backgroundColor = UIColor.gray // Este color se debe settear dependiendo del sender
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews(){
        self.addSubview(messageLabel)
    }
    
    private func setupConstraints(){
        messageLabelConstraints()
    }
    
    func setBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }
    
    private func messageLabelConstraints(){
        NSLayoutConstraint.activate(
            [
                messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
                messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
                messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
                messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            ]
        )
    }
}
