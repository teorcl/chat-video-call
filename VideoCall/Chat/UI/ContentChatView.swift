//
//  ContentChatView.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 16/02/24.
//

import Foundation
import UIKit

class ContentChatView: UIView {
    
    lazy var bubbleChatView: BubbleChatView = {
        let bubbleChat = BubbleChatView()
        bubbleChat.translatesAutoresizingMaskIntoConstraints = false
        return bubbleChat
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .white
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews(){
        self.addSubview(bubbleChatView)
    }
    
    private func setupConstraints(){
        bubbleChatViewConstraints()
    }
    
    private func bubbleChatViewConstraints(){
        NSLayoutConstraint.activate(
            [
                bubbleChatView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                bubbleChatView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                bubbleChatView.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
                bubbleChatView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 20),
                bubbleChatView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -20),
                //bubbleChatView.widthAnchor.constraint(equalToConstant: 150),
                //bubbleChatView.heightAnchor.constraint(equalToConstant: 70),
            ]
        )
    }
}
