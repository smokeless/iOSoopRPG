//
//  enemy.swift
//  rpgobjectoriented
//
//  Created by Ross Russell on 4/12/16.
//  Copyright © 2016 com.orangemelt. All rights reserved.
//

import Foundation

class Enemy:Character {
  
  var loot: [String] {
    return [ "rusty dagger", "cracked buckler", "campaign pin", "Silly stuff"]
  }
  
  
  var type: String {
    return "Grunt"
  }
  
  
  func dropLoot()->String?{
    if !isAlive{
      let rand = Int(arc4random_uniform(UInt32(loot.count)))//random number based on array.
      return loot[rand]
    }
    return nil
  }
  
  


}