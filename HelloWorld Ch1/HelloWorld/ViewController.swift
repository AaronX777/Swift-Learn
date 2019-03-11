//
//  ViewController.swift
//  HelloWorld
//
//  Created by rd on 2019/2/19.
//  Copyright © 2019 aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func showMessage(sender: UIButton){
        let alertController = UIAlertController(title: "Wellcom to My Fist App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
     alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController,animated: true,completion: nil)
    }

}

