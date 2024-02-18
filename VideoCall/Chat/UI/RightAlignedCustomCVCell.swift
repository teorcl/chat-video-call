//
//  RightAlignedCustomCVCell.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 17/02/24.
//

import Foundation
import UIKit

class RightAlignedCustomCVCell: UICollectionViewCell {
    let bubbleView = BubbleChatView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(bubbleView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            bubbleView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 50), // Alineamos a la derecha
            bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
