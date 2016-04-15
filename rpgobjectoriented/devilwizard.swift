//
//  devilwizard.swift
//  rpgobjectoriented
//
//  Created by Ross Russell on 4/12/16.
//  Copyright © 2016 com.orangemelt. All rights reserved.
//

import Foundation


class DevilWizard: Enemy {
  
  override var loot: [String]{
    return ["flaming lipstick", "a leg bone", "salted pork", "chorizo"]
  }
  
  override var type: String{
    return "devil wizard"
  }
  
  
}