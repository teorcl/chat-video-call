//
//  ChatViewController.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 16/02/24.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {
    
    let contenView = ContentChatView()
    
    override func loadView() {
        //self.view = controllersView
        self.view = contenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //debugPrint(self.view == controllersView)
        debugPrint(self.view == contenView)
    }
}
