//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Samet Korkmaz on 12.04.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       /* YapilacakEkle(isim: "Serkan", yas: 22, isPremium: false)
        YapilacakEkle(isim: "Serkan", yas: 22, isPremium: false)
        YapilacakEkle(isim: "Samet", yas: 22, isPremium: false)
        YapilacakEkle(isim: "Samet", yas: 22, isPremium: false)
        YapilacakEkle(isim: "Serkan", yas: 22, isPremium: false)
        KayitSorgula() */
        //KayitGuncelle()
        KayitSil()
        KayitSorgula()
    }
    
    func YapilacakEkle(isim: String, yas: Int, isPremium: Bool){
        
        let context = ContextGetir()
        let entity = NSEntityDescription.entity(forEntityName: "CoreDataModel", in: context)
        
        let kayit = NSManagedObject(entity: entity!, insertInto: context)
        
        kayit.setValue(isim, forKey: "alan1")
        kayit.setValue(yas, forKey: "alan2")
        kayit.setValue(isPremium, forKey: "alan3")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext() // context i kaydediyoruz
    }
    
    
    func ContextGetir() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func KayitSorgula(){
        
        let fetchRequest : NSFetchRequest<CoreDataModel> = CoreDataModel.fetchRequest()

        do {
            let kayitlar = try ContextGetir().fetch(fetchRequest)
            
            for kayit in kayitlar {
                print(kayit.alan1!)
            }
        }
        catch {
            print("hata oluştu")
        }
        
    }
    
    func KayitSorgula(isim: String) -> [CoreDataModel]?{
        
        let fetchRequest : NSFetchRequest<CoreDataModel> = CoreDataModel.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "alan1 = %@", isim)
        
        do {
            return try ContextGetir().fetch(fetchRequest)
             
            }
        catch {
            print("hata oluştu")
        }
        return nil
    }
    
    func KayitGuncelle () {
        
        if let kayitlar = KayitSorgula(isim: "Samet"){
            
            for kayit in kayitlar {
                kayit.alan1 = "Samet3"
            }
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()  // kaydetme işlemi
    }
    
    func KayitSil() {
        
        if let kayitlar = KayitSorgula(isim: "Serkan"){
            for kayit in  kayitlar {
                ContextGetir().delete(kayit)
            }
            (UIApplication.shared.delegate as! AppDelegate).saveContext()  // kaydetme işlemi
        }
    }
}

