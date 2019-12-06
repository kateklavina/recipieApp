//
//  recipie.swift
//  recipieApp
//
//  Created by Dace Laizane on 04/12/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import Foundation
struct Recipie {
    
    let name: String
    let picture: String
    
    static func createRecepie() -> [Recipie]{
        var recipies: [Recipie] = []
        
        let names = DataManager.shared.name
        let picture = DataManager.shared.picture
        
        
        for index in 0..<names.count{
            let recepie = Recipie(name: names[index], picture: picture[index])
            recipies.append(recepie)
        }
        return recipies
    }
    
}
