//
//  CustomCollectionViewCell.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 17/02/24.
//

import Foundation
import UIKit

/*class CustomCollectionViewCell: UICollectionViewCell {
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0 // Permite múltiples líneas si es necesario
        return label
    }()
    
    // Constructor, configuración de la vista
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(messageLabel)
        contentView.backgroundColor = .white
    }

    // Requerido por la herencia de UICollectionViewCell
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Método para configurar el mensaje de la celda
    func configure(with message: String) {
        messageLabel.text = message
    }

    // Asegúrate de actualizar el diseño de la etiqueta en caso de cambios de tamaño
    override func layoutSubviews() {
        super.layoutSubviews()
        messageLabel.frame = contentView.bounds
    }
    
}*/

class CustomCollectionViewCell: UICollectionViewCell {
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
            bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8), // Alineamos a la izquierda
            bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -50)
        ])
    }
}
