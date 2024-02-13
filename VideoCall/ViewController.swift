//
//  ViewController.swift
//  VideoCall
//
//  Created by Teodoro Calle Lara on 13/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    //let controllersView = ControllersVideoCallView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
    let contenView = ContentView()
    
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

