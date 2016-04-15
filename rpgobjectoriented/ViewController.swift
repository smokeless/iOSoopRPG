//
//  ViewController.swift
//  rpgobjectoriented
//
//  Created by Ross Russell on 4/6/16.
//  Copyright © 2016 com.orangemelt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var printLabel: UILabel!
  
  @IBOutlet weak var playerHP: UILabel!
  
  @IBOutlet weak var enemyHpLabel: UILabel!
  @IBOutlet weak var chestButton: UIButton!
  @IBOutlet weak var enemyImage: UIImageView!
  
  var player: Player!
  var enemy: Enemy!
  var chestMessage:String?
  
  
  @IBAction func attackClicked(sender: AnyObject) {
    if enemy.attemptAttack(player.attackPwr){
      printLabel.text = "Attacked \(enemy.type) for \(player.attackPwr)."
      enemyHpLabel.text = "\(enemy.hp)"
    }else{
      printLabel.text = "Attack was unsuccessful!"
    }
    if let loot = enemy.dropLoot(){
      player.addItemToInventory(loot)
      chestMessage = "\(player.name) found \(loot)"
      chestButton.hidden = false
    }
    if !enemy.isAlive{
      enemyHpLabel.text = ""
      printLabel.text = "Killed \(enemy.type)"
      enemyImage.hidden = true
    }
  }
  
  
  @IBAction func chestClicked(sender: AnyObject) {
    chestButton.hidden = true
    printLabel.text = chestMessage
    NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    
  }
  
  
  
  //This shit gets called right at load
  override func viewDidLoad() {
    player = Player(name: "player", hp: 110, attackPwr: 20)
    playerHP.text = "\(player.hp) HP"
    generateRandomEnemy()
    enemyHpLabel.text = "\(enemy.hp)"
  }
  
  func generateRandomEnemy(){
    let rand = Int(arc4random_uniform(2))
    enemyImage.hidden = false
    if rand == 0 {
      enemy = Wizard(startingHp: 200, attackPwr: 30)
    } else {
      enemy = DevilWizard(startingHp: 300, attackPwr: 20)
    }
    enemyHpLabel.text="\(enemy.hp)"
    printLabel.text="A wild \(enemy.type) appears."
  }
}

