//
//  ViewController.swift
//  Firebase_Deneme
//
//  Created by Samet Korkmaz on 14.05.2024.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Auth.auth().createUser(withEmail: "samet.2002@gmail.com", password: "1234567890") { authResult, error in
            if error != nil { // hata var
                
            }
            else {
                self.HizmetKaydet()
            }
            
        }
    }
    func HizmetKaydet(){
        
    }

}

