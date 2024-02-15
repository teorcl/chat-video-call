//
//  VideoCallPreview.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 14/02/24.
//

import Foundation
import UIKit

class VideoCallPreview: UIView {
    
    private lazy var swapCamera: UIButton = {
        let swapCamera = UIButton()
        swapCamera.setImage(UIImage(named: "arrow.triangle.2.circlepath.camera.fill"), for: .normal)
        swapCamera.translatesAutoresizingMaskIntoConstraints = false
        swapCamera.backgroundColor = .black.withAlphaComponent(0.6)
        return swapCamera
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black.withAlphaComponent(0.2)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Asegúrate de que la vista ocupe el 30% del ancho y el 25% del alto de su contenedor
        let width = superview?.bounds.width ?? 0
        let height = superview?.bounds.height ?? 0
        //frame = CGRect(x: 0, y: 0, width: width * 0.3, height: height * 0.25)
        swapCamera.layer.cornerRadius = swapCamera.bounds.height / 2
    }
    
    private func setupView(){
        layer.cornerRadius = 12
        layer.masksToBounds = true
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews(){
        self.addSubview(swapCamera)
    }
    
    private func addConstraints(){
        swapCameraConstraits()
    }
    
    private func swapCameraConstraits(){
        
        NSLayoutConstraint.activate(
            [
                swapCamera.widthAnchor.constraint(equalToConstant: 40),
                swapCamera.heightAnchor.constraint(equalToConstant: 40),
                swapCamera.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                swapCamera.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            ]
        )
    }
}
