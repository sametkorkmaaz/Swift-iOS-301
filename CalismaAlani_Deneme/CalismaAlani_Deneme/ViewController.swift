//
//  ViewController.swift
//  CalismaAlani_Deneme
//
//  Created by Samet Korkmaz on 11.05.2024.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonStr = "{\"Ad\" : \"Ad 1\", \"Soyad\" : \"Soyad1\"}"
        
        if let strData = jsonStr.data(using: .utf8){
            let json = JSON(strData)
            
            var kisi = Kisi()
            kisi.Ad = json["Ad"].stringValue
            kisi.Soyad = json["Soyad"].stringValue
            print(kisi.Ad)
        }
            
    }


}

class Kisi {
    var Ad = ""
    var Soyad = ""
}
