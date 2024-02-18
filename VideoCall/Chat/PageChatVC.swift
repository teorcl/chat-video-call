//
//  PageChatVC.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 17/02/24.
//

import Foundation
import UIKit

class PageChatVC: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0 // Espacio mínimo entre las celdas en la misma fila
        layout.minimumLineSpacing = 0 // Espacio mínimo entre las filas de celdas
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(RightAlignedCustomCVCell.self, forCellWithReuseIdentifier: "rightCell")
        collectionView.backgroundColor = .white
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension PageChatVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Retorna el número de elementos en tu colección
        return 100
    }

    /*func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        // Configura la celda con la BubbleChatView
        return cell
    }*/
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            cell.bubbleView.setBackgroundColor(.systemGray2)
            cell.bubbleView.textAlignment = .left
            cell.bubbleView.textMessage = "..--.-.-.-.----.-.-.-.-.--.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-..-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.fghfghgfhgfhgfhfhfghfghgfhghghgfhsdkjahdjakshdsjhdkjahdsajkhdjakhdakjdhajk"
            // Configura la celda con la BubbleChatView
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rightCell", for: indexPath) as! RightAlignedCustomCVCell
            cell.bubbleView.setBackgroundColor(.blue)
            cell.bubbleView.textAlignment = .right
            cell.bubbleView.textMessage = "Holi hjsajdnnalpswsdqwlklklqkelakwdslkslkalkdasdkasldkasldklalldalskdl"
            // Configura la celda con la BubbleChatView alineada a la derecha
            return cell
        }
    }
}

extension PageChatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Define el tamaño de cada celda, por ejemplo:
//        return CGSize(width: collectionView.frame.size.width, height: 50)
        //let chat = chatsArray[indexPath.item]
        
        if indexPath.item % 2 == 0{
            let chat = "..--.-.-.-.----.-.-.-.-.--.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-..-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.fghfghgfhgfhgfhfhfghfghgfhghghgfhsdkjahdjakshdsjhdkjahdsajkhdjakhdakjdhajk"
                    let size = CGSize(width: 250, height: 1000)
                    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                    var estimatedFrame = NSString(string: chat).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
                    //var estimatedFrame = NSString(string: chat.text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
                    estimatedFrame.size.height += 16
                    
                    return CGSize(width: collectionView.frame.width, height: estimatedFrame.height)
        }else {
            let chat = "Holi hjsajdnnalpswsdqwlklklqkelakwdslkslkalkdasdkasldkasldklalldalskdl"
                    let size = CGSize(width: 250, height: 1000)
                    let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                    var estimatedFrame = NSString(string: chat).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
                    //var estimatedFrame = NSString(string: chat.text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
                    estimatedFrame.size.height += 16
                    
                    return CGSize(width: collectionView.frame.width, height: estimatedFrame.height)
        }
        
        
        
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Establecemos una altura mínima para la celda
        let minHeight: CGFloat = 1
        
        // Ancho del collectionView
        let width = collectionView.frame.size.width
        
        // Creamos una celda temporal para calcular el tamaño
        let dummyCell = CustomCollectionViewCell(frame: CGRect(x: 0, y: 0, width: width, height: minHeight))
        
        // Configuramos la celda con datos
        //dummyCell.bubbleView.messageLabel.text = "fghfghgfhgfhgfhfhfghfghgfhghghgfhsdkjahdjakshdsjhdkjahdsajkhdjakhdakjdhajk"
        dummyCell.bubbleView.messageLabel.text = "...................................................................................................................................................................................."
        // Forzamos el layout de la celda para que se ajuste a su contenido
        dummyCell.layoutIfNeeded()
        
        // Obtenemos el tamaño intrínseco de la celda
        let size = dummyCell.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height))
        
        // Devolvemos el tamaño de la celda, asegurándonos de que tenga una altura mínima
        return CGSize(width: width, height: max(size.height, minHeight))
    }*/
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let minHeight: CGFloat = 140
        return CGSize(width: width, height: minHeight)
    }*/
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.size.width
            var height: CGFloat = 100 // Altura mínima de la celda
            
            let dummyCell: UICollectionViewCell
            if indexPath.item % 2 == 0 {
                dummyCell = CustomCollectionViewCell(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
            } else {
                dummyCell = RightAlignedCustomCVCell(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
            }
            
            configureCell(dummyCell, at: indexPath)
            
            // Hacemos un layout de la celda temporal para obtener su altura
            dummyCell.contentView.layoutIfNeeded()
            
            // Obtenemos la altura del BubbleChatView
            if let bubbleView = (dummyCell as? CustomCollectionViewCell)?.bubbleView {
                height = bubbleView.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)).height
            } else if let bubbleView = (dummyCell as? RightAlignedCustomCVCell)?.bubbleView {
                height = bubbleView.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)).height
            }
            
            return CGSize(width: width, height: height)
        }
        
        private func configureCell(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
            if let customCell = cell as? CustomCollectionViewCell {
                customCell.bubbleView.setBackgroundColor(.blue)
                customCell.bubbleView.textAlignment = .left
                customCell.bubbleView.messageLabel.text = "Mensaje de ejemplo en la celda ---------------------------------------------------------------------------------------\(indexPath.item)"
            } else if let rightAlignedCell = cell as? RightAlignedCustomCVCell {
                rightAlignedCell.bubbleView.setBackgroundColor(.green)
                rightAlignedCell.bubbleView.textAlignment = .right
                //rightAlignedCell.bubbleView.messageLabel.text = "Mensaje de ejemplo en la celda \(indexPath.item)"
            }
        }*/
}
