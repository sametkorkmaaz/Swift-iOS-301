//
//  VC_EkleDuzenle.swift
//  CoreDataLab
//
//  Created by Samet Korkmaz on 13.04.2024.
//

import UIKit
import CoreData
class VC_EkleDuzenle: UIViewController {

    @IBOutlet weak var tf_Eposta: UITextField!
    @IBOutlet weak var tf_Soyad: UITextField!
    @IBOutlet weak var tf_Ad: UITextField!
    
    var kisi : Kisi?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if kisi != nil {
            tf_Ad.text = kisi!.ad
            tf_Soyad.text = kisi!.soyad
            tf_Eposta.text = kisi!.eposta
        }
    }
    


    @IBAction func btn_Vazgec(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn_Kaydet(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if kisi == nil {
            let entity = NSEntityDescription.entity(forEntityName: "Kisi", in: context)
            
            let kisi = NSManagedObject(entity: entity!, insertInto: context)
            
            kisi.setValue(tf_Ad.text!, forKey: "ad")
            kisi.setValue(tf_Soyad.text!, forKey: "soyad")
            kisi.setValue(tf_Eposta.text!, forKey: "eposta")
        }
        else {
            kisi!.ad = tf_Ad.text!
            kisi!.soyad = tf_Soyad.text!
            kisi!.eposta = tf_Eposta.text!
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
    }
}
