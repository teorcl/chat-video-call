//
//  CallEndButton.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 13/02/24.
//

import Foundation
import UIKit

class CallEndButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setImage(UIImage(named: "phone.fill"), for: .normal)
        imageView?.contentMode = .scaleAspectFit
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
        backgroundColor = UIColor.red
    }
}
