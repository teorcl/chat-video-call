//
//  VideoCallToolsView.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 13/02/24.
//

import Foundation
import UIKit

protocol VideoCallToolsViewDelegate: AnyObject {
    func speakerButtonTapped()
    func videoCamButtonTapped()
    func volumeButtonTapped()
    func messageButtonTapped()
}

class VideoCallToolsView: UIView {
    
    weak var delegate: VideoCallToolsViewDelegate?
    
    lazy var speakerButton: UIButton = {
        return createButton(imageName: "mic.fill", action: #selector(speakerButtonTapped))
    }()
    
    lazy var videoCamButton: UIButton = {
        return createButton(imageName: "video.fill", action: #selector(videoCamButtonTapped))
    }()
    
    lazy var volumeButton: UIButton = {
        return createButton(imageName: "speaker.slash", action: #selector(volumeButtonTapped))
    }()
    
    lazy var messageButton: UIButton = {
        return createButton(imageName: "ellipsis.message.fill", action: #selector(messageButtonTapped))
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
        layer.cornerRadius = 26
        layer.masksToBounds = true
        backgroundColor = UIColor.blue
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews(){
        self.addSubview(speakerButton)
        self.addSubview(videoCamButton)
        self.addSubview(volumeButton)
        self.addSubview(messageButton)
    }
    
    private func setupConstraints(){
        speakerButtonConstraints()
        videoCamButtonConstraints()
        volumeButtonConstraints()
        messageButtonConstraints()
    }
    
    private func speakerButtonConstraints(){
        NSLayoutConstraint.activate(
            [
                speakerButton.widthAnchor.constraint(equalToConstant: 40),
                speakerButton.heightAnchor.constraint(equalToConstant: 40),
                speakerButton.trailingAnchor.constraint(equalTo: videoCamButton.leadingAnchor, constant: -30),
                speakerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ]
        )
    }
    
    private func  videoCamButtonConstraints(){
        NSLayoutConstraint.activate(
            [
                videoCamButton.widthAnchor.constraint(equalToConstant: 40),
                videoCamButton.heightAnchor.constraint(equalToConstant: 40),
                videoCamButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -60),
                videoCamButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ]
        )
    }
    
    private func  volumeButtonConstraints(){
        NSLayoutConstraint.activate(
            [
                volumeButton.widthAnchor.constraint(equalToConstant: 40),
                volumeButton.heightAnchor.constraint(equalToConstant: 40),
                volumeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 60),
                volumeButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ]
        )
    }
    
    private func  messageButtonConstraints(){
        NSLayoutConstraint.activate(
            [
                messageButton.widthAnchor.constraint(equalToConstant: 40),
                messageButton.heightAnchor.constraint(equalToConstant: 40),
                messageButton.leadingAnchor.constraint(equalTo: volumeButton.trailingAnchor, constant: 30),
                messageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ]
        )
    }
    
    private func createButton(imageName: String, action: Selector?) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }
    
    @objc private func speakerButtonTapped() {
        delegate?.speakerButtonTapped()
    }
    
    @objc private func videoCamButtonTapped() {
        delegate?.videoCamButtonTapped()
    }
    
    @objc private func volumeButtonTapped() {
        delegate?.volumeButtonTapped()
    }
    
    @objc private func messageButtonTapped() {
        delegate?.messageButtonTapped()
    }
}
