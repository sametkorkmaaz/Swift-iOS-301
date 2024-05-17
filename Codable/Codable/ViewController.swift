//
//  ViewController.swift
//  Codable
//
//  Created by Samet Korkmaz on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var k = Kisi(isim: "Samet", soyisim: "Korkmaz")
        
        let encoder = JSONEncoder()
        
        let json =  try! encoder.encode(k)
        
        let strJson = String(data: json, encoding: .utf8)
        
        print(strJson)
        
        let decoder = JSONDecoder()
        let d = try! decoder.decode(Kisi.self, from: json)
        print(d.isim)
    }



}
struct Kisi : Codable {
    var isim : String
    var soyisim : String
    
    enum CodingKeys : String, CodingKey {
        case isim = "Name"
        case soyisim = "Surname"
    }
}

