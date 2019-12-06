//
//  FirstTableViewController.swift
//  recipieApp
//
//  Created by Dace Laizane on 02/12/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
var userName : String!
    
    var recepies = Recipie.createRecepie()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
              return recepies.count
          }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipieCell", for: indexPath) as? RecepieTableViewCell else {return UITableViewCell()}

        let recepie = recepies[indexPath.row]
//        cell.textLabel?.text = recepie.name
//        cell.imageView?.image = UIImage(named: recepie.picture)
        cell.recepieImage.image = UIImage(named: recepie.picture)
        cell.recepieLabel.text = recepie.name

        return cell
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
               
               
               let curentTrack = recepies.remove(at: fromIndexPath.row)
               recepies.insert(curentTrack, at: to.row)
               tableView.reloadData()

           }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
