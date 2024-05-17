//
//  ViewController.swift
//  CoreDataLab
//
//  Created by Samet Korkmaz on 13.04.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView_Kisiler: UITableView!
    var KisiListesi : [Kisi]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        KisilerGetir()
    }
    // satır sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if KisiListesi != nil {
            return KisiListesi!.count
        }
        return 0
    }
    // satırların içeriği
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = KisiListesi![indexPath.row].ad! + " " + KisiListesi![indexPath.row].soyad!
        return cell
    }
    // satırlardan biri seçilince
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "kayitGuncelle", sender: indexPath.row)
    }
    // satırı sola çekince silme
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.delete(KisiListesi![indexPath.row])
            
            KisilerGetir()
        }
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "kayitGuncelle" {
            let hedefVc = segue.destination as! VC_EkleDuzenle
            hedefVc.kisi = KisiListesi![sender as! Int]
        }
    }
    func KisilerGetir(){
    
        let fr : NSFetchRequest<Kisi> = Kisi.fetchRequest()
        fr.sortDescriptors = [NSSortDescriptor(key: "ad", ascending: true)] // filtreleme işlemleri
        
        do{
            KisiListesi = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fr)
            
            tableView_Kisiler.reloadData()
        }
        catch{}
    }
    
    
}

