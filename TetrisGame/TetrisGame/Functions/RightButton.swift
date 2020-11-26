//
//  RightButton.swift
//  TetrisGame
//
//  Created by Matthew Lee on 30/08/2020.
//  Copyright © 2020 Matthew Lee. All rights reserved.
//

import Foundation
import SpriteKit

class RightButton{
    let btn = SKSpriteNode()
    init(){
        btn.texture = SKTexture(imageNamed: "right_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "right"
        btn.zPosition = 1
        btn.position = CGPoint(x: Int(Variables.scene.frame.width) - 50, y: -Int(Variables.scene.frame.height) + 50 )
        Variables.scene.addChild(btn)
    }
    
    func anime(){
        var textures = Array<SKTexture>()
        for i in 1...15{
            let name =  "right_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    
    func brickMoveRight(){
        if isMovable(){
            Variables.dx += 1
            var action = SKAction()
            for (i, item) in Variables.brickArrays.enumerated(){
                let x = Int(item.x) + Variables.dx
                let y = Int(item.y) + Variables.dy
                
                Variables.backarrays[y][x - 1] -= 1
                Variables.backarrays[y][x] += 1
                action = SKAction.moveBy(x: CGFloat(Variables.brickValue.brickSize), y: 0, duration: 0.1)
                Variables.brickNode[i].run(action)
            }

            
            anime()
        }

    }
    
    func isMovable() -> Bool{
//        var right = Variables.brickArrays[0]
//        for i in Variables.brickArrays{
//            if right.x < i.x{
//                right = i
//            }
//        }
//        let xValue = Int(right.x) + Variables.dx + 1
//        if Variables.backarrays[Variables.dy][xValue] != 0{
//            return false
//        }
//        else{
//            return true
//        }
      
      for item in Variables.brickArrays{
          let x = Int(item.x) + Variables.dx
          let y = Int(item.y) + Variables.dy
          if Variables.backarrays[y][x+1] == 2{
              return false
          }
      }
      return true
        
    }
}
