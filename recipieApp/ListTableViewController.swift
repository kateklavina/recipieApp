//
//  ListTableViewController.swift
//  recipieApp
//
//  Created by Dace Laizane on 04/12/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController {

    var greseries = [Grocery]()
    var manageObjectContext: NSManagedObjectContext?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageObjectContext = appDelegate.persistentContainer.viewContext
       
    }

 func loadData(){
     let request: NSFetchRequest<Grocery> = Grocery.fetchRequest()
     
     do{
         let result = try manageObjectContext?.fetch(request)
         greseries = result!
         tableView.reloadData()
     }catch{
         fatalError("Error in retrieving Grocery items")
     }
 }
 
 func saveData(){
     do{
       
         try manageObjectContext?.save()
         
     }catch{
         fatalError("Error in saving data")
     }
     tableView.reloadData()
 }

    @IBAction func addListItem(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Grocery Item", message: "What do you want to buy?", preferredStyle: .alert)
                alertController.addTextField { (textField:UITextField) in
                    
                }
                
                let addAction = UIAlertAction(title: "Add", style: .default) {
                    (action: UIAlertAction) in
                
                    let textFiled = alertController.textFields?.first
        //            self.groseries.append(textFiled!.text!)
        //            self.tableView.reloadData()
                    let entity = NSEntityDescription.entity(forEntityName: "Grocery", in: self.manageObjectContext!)
                    let grocery = NSManagedObject(entity: entity!, insertInto: self.manageObjectContext)
                    grocery.setValue(textFiled?.text, forKey: "name")
                    self.saveData()
                    self.loadData()
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alertController.addAction(addAction)
                alertController.addAction(cancelAction)
                present(alertController, animated:true, completion: nil)
    }
    
    // MARK: - Table view data source

       override func numberOfSections(in tableView: UITableView) -> Int {
           
           return 1
       }

       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
           return greseries.count
       }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)

        //cell .textLabel?.text = groseries[indexPath.row]
        let grocery = greseries[indexPath.row]
        cell.textLabel?.text = grocery.value(forKey: "name") as? String
        cell.accessoryType = grocery.completed ? .checkmark : .none
        
        return cell
    }
    // MARK: - TableView Delegate
       
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data sourc
                
                manageObjectContext!.delete(greseries[indexPath.row])
                
            }
            self.saveData()
            self.loadData()
        }


        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            greseries[indexPath.row].completed = !greseries[indexPath.row].completed
            
            self.saveData()
            self.loadData()
        }

    }

//end vc 
