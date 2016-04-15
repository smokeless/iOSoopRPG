//
//  wizard.swift
//  rpgobjectoriented
//
//  Created by Ross Russell on 4/12/16.
//  Copyright © 2016 com.orangemelt. All rights reserved.
//

import Foundation

class Wizard: Enemy {
  let IMMUNE_MAX = 15
  
  override var loot: [String]{
    return ["wizard stuff", "magic stuff", "rare fish dust"]
  }
  
  override var type: String{
    return "wizard"
  }
  
  override func attemptAttack(attackPwr: Int) -> Bool {
    if attackPwr >= IMMUNE_MAX{
      return super.attemptAttack( attackPwr )
    }else{
      return false
    }
  }
}