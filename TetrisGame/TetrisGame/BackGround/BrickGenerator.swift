//
//  BrickGenerator.swift
//  TetrisGame
//
//  Created by Matthew Lee on 30/08/2020.
//  Copyright © 2020 Matthew Lee. All rights reserved.
//

import Foundation
import SpriteKit

class BrickGenerator {
    
    
    init() {
        Variables.dx = 4
        Variables.dy = 2
        Variables.brickValue = Variables.newBrickArrays[0]
        
        let brickValue = Variables.brickValue
        let brick = brickValue.points
        Variables.brickArrays = brick
        Variables.brickNode.removeAll()
        for item in brick{
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backarrays[y][x]=1
            
            let xValue = x*brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y*brickValue.brickSize + Int(Variables.startPoint.y)
            let brick = SKSpriteNode()
            brick.color = brickValue.color
            brick.texture = SKTexture(imageNamed: brickValue.brickName)
            brick.size = CGSize(width: brickValue.brickSize - Variables.gab, height: brickValue.brickSize - Variables.gab)
            brick.setScale(2.7)
            brick.lightingBitMask = 0b0001
            brick.name = brickValue.brickName
            brick.zPosition = brickValue.zPosition
            brick.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(brick)
            Variables.brickNode.append(brick)
        }
    }
}
