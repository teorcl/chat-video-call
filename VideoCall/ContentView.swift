//
//  ContentView.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 13/02/24.
//

import Foundation
import UIKit

class ContentView: UIView {
    
    lazy var videoCallToolsView: VideoCallToolsView = {
       let videoCallToolsView = VideoCallToolsView()
        videoCallToolsView.layer.masksToBounds = true
        videoCallToolsView.backgroundColor = .black
        videoCallToolsView.translatesAutoresizingMaskIntoConstraints = false
        return videoCallToolsView
    }()
    
    lazy var callEndButton: CallEndButton = {
        let callEndButton = CallEndButton()
        callEndButton.translatesAutoresizingMaskIntoConstraints = false
        return callEndButton
    }()
    
    lazy var videoCallPreview: VideoCallPreview = {
        let videoCallPreview = VideoCallPreview()
        videoCallPreview.translatesAutoresizingMaskIntoConstraints = false
        return videoCallPreview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        callEndButton.layer.cornerRadius = callEndButton.bounds.height / 2
    }
    
    private func setupView(){
        self.backgroundColor = .cyan
        addSubViews()
        addConstraints()
    }
    
    private func addSubViews(){
        self.addSubview(videoCallToolsView)
        self.addSubview(callEndButton)
        self.addSubview(videoCallPreview)
    }
    
    private func addConstraints(){
        videoCallToolsViewConstraints()
        callEndButtonConstraints()
        videoCallPreviewConstraints()
    }
    
    private func videoCallToolsViewConstraints(){
        NSLayoutConstraint.activate(
            [
                videoCallToolsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50.0),
                videoCallToolsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
                videoCallToolsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
                videoCallToolsView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -800.0),
            ]
        )
    }
    
    private func callEndButtonConstraints(){
        NSLayoutConstraint.activate(
            [
                callEndButton.centerXAnchor.constraint(equalTo: videoCallToolsView.centerXAnchor),
                callEndButton.centerYAnchor.constraint(equalTo: videoCallToolsView.centerYAnchor,constant: -30),
                callEndButton.widthAnchor.constraint(equalToConstant: 60),
                callEndButton.heightAnchor.constraint(equalToConstant: 60),
            ]
        )
    }
    
    private func videoCallPreviewConstraints(){
        let width = bounds.width
        let height = bounds.height
        NSLayoutConstraint.activate(
            [
                videoCallPreview.topAnchor.constraint(
                    equalTo: safeAreaLayoutGuide.topAnchor,constant: 10
                ),
                videoCallPreview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
                
                videoCallPreview.widthAnchor.constraint(equalToConstant: 140),
                videoCallPreview.heightAnchor.constraint(equalToConstant: 230),
                
            ]
        )
    }
}
