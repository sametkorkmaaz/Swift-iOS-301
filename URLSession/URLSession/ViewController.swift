//
//  ViewController.swift
//  URLSession
//
//  Created by Samet Korkmaz on 12.05.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var request = URLRequest(url: URL(string: "")!)
        
        var header = [String: String]()
        header["Content-Type"] = "applicatioın/json"
        
        header["Autorization"] = "Token değeri"
        
        request.allHTTPHeaderFields = header
        
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                
            }
            else {
                let sonuc = response as! HTTPURLResponse
                if sonuc.statusCode == 200 {
                    //dönüştrme işlemleri
                    DispatchQueue.main.async {
                         // UI güncelleme
                    }
                }
                else {
                    // servis hatası
                }
            }
        }.resume()
    }


}

