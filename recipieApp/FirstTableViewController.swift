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
    var list = [
    "https://www.allrecipes.com/video/8158/mac-and-shews-vegan-mac-and-cheese/?internalSource=videocard&referringContentType=Search&clickId=cardslot%205",
    "https://www.allrecipes.com/recipe/14830/hummus-iii/?internalSource=hub%20recipe&referringId=738&referringContentType=Recipe%20Hub",
        "https://www.allrecipes.com/recipe/17165/big-soft-ginger-cookies/?internalSource=hub%20recipe&referringContentType=Search&clickId=cardslot%201",
        "https://www.allrecipes.com/recipe/16330/stuffed-peppers/?internalSource=hub%20recipe&referringContentType=Search",
       "https://www.allrecipes.com/recipe/13977/cherry-cheezecake/?clickId=right%20rail0&internalSource=rr_feed_recipe_sb&referringId=17393%20referringContentType%3Drecipe",
       "https://www.allrecipes.com/recipe/17393/best-carrot-cake-ever/?internalSource=hub%20recipe&referringId=1689&referringContentType=Recipe%20Hub&clickId=cardslot%2013",
       "https://www.allrecipes.com/recipe/20513/classic-waffles/?internalSource=streams&referringId=1316&referringContentType=Recipe%20Hub&clickId=st_trending_s",
       "https://www.allrecipes.com/recipe/270200/cranberry-orange-rolls/?internalSource=staff%20pick&referringId=78&referringContentType=Recipe%20Hub&clickId=cardslot%201"
    ]
    
    
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


    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
               
               
               let curentTrack = recepies.remove(at: fromIndexPath.row)
               recepies.insert(curentTrack, at: to.row)
               tableView.reloadData()

           }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row at \(indexPath.row) !")
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: WebViewController = storyBoard.instantiateViewController(identifier: "WebViewController") as! WebViewController
        
        vc.passedValue = list[indexPath.row]
        
        self.present(vc, animated: true, completion: nil)
        
    }
}
