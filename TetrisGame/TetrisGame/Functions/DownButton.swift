//
//  DownButton.swift
//  TetrisGame
//
//  Created by Matthew Lee on 31/08/2020.
//  Copyright © 2020 Matthew Lee. All rights reserved.
//

import Foundation
import SpriteKit

class DownButton{
    let btn = SKSpriteNode()
    init(){
        btn.texture = SKTexture(imageNamed: "down_btn1")
        btn.size = CGSize(width: 50, height: 50)
        btn.name = "down"
        btn.zPosition = 1
        let point1 = Int(Variables.scene.frame.width) / 2
        let point2 = -50
        let xValue = (point1 - point2) / 2
        btn.position = CGPoint(x: xValue, y: -Int(Variables.scene.frame.height) + 50 )
        Variables.scene.addChild(btn)
    }
    func anime(){
        var textures = Array<SKTexture>()
        for i in 1...15{
            let name =  "down_btn\(i)"
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        btn.run(action)
    }
    
    func brickDown(){
        if isbrickDownable(){
            possibleDown()
//            anime()
        }
        else{
            impossibleDown()
        }
    }
    
    
    //if block is possible going down
    func possibleDown(){
        
        Variables.dy += 1
        var action = SKAction()
        for (i, item) in Variables.brickArrays.enumerated(){
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            
            Variables.backarrays[y - 1][x] -= 1
            Variables.backarrays[y][x] += 1
            action = SKAction.moveBy(x: 0, y: -CGFloat(Variables.brickValue.brickSize), duration: 0.1)
            Variables.brickNode[i].run(action)
        }
    }
    
     //if block is impossible going down
    // create newblock and shift the node
    func impossibleDown(){
        //change value to 2
        for item in Variables.brickArrays{
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            Variables.backarrays[y][x] = 2
            //create newblock
            let blocked = SKSpriteNode()
            blocked.color = .gray
            blocked.size = CGSize(width: Variables.brickValue.brickSize - Variables.gab, height: Variables.brickValue.brickSize - Variables.gab)
            blocked.name = "blocked"
            let xValue = x * Variables.brickValue.brickSize + Int(Variables.startPoint.x)
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            blocked.position = CGPoint(x: xValue, y: -yValue)
            Variables.scene.addChild(blocked)
            Variables.blockedArrays.append(blocked)
        }
//        erase current block
        for item in Variables.brickNode{
            item.removeFromParent()
        }
        //data check
        for item in Variables.backarrays{
            print(item)
        }
        
        checkDelete()
    }
    
    func checkDelete(){
        // erase duplicate y value
        var set = Set<Int>()
        for item in Variables.brickArrays{
            let y = Int(item.y) + Variables.dy
            set.insert(y)
        }
        //check row
        for y in set.sorted(){
            let yValue = y * Variables.brickValue.brickSize + Int(Variables.startPoint.y)
            if !Variables.backarrays[y].contains(0){
                Variables.backarrays.remove(at: y)
                
                var rowArray = Array<Int>()
                for i in 0..<Variables.row{
                    rowArray.append(0)
                }
                rowArray[rowArray.startIndex] = 2
                rowArray[rowArray.endIndex - 1] = 2
                Variables.backarrays.insert(rowArray, at: 1)
                
                //sound delete
                Variables.blockedArrays.first?.run(SKAction.playSoundFileNamed("delete.wav", waitForCompletion: false))
                
                //sound emitter
                fire(position: CGPoint(x: Int(Variables.scene.frame.width) / 2, y: -yValue ))
                
                for item in Variables.blockedArrays{
                    //same line
                    if Int(item.position.y) == -yValue{
                        if let removeItem = Variables.blockedArrays.firstIndex(of: item){
                            Variables.blockedArrays.remove(at: removeItem)
                            var action = SKAction()
                            action = SKAction.fadeOut(withDuration: 0.1)
                            item.run(action){
                                item.removeFromParent()
                            }
                        }
                    }
                    // same line but upper, need to bring it down
                    if Int(item.position.y) > -yValue{
                        var action = SKAction()
                        action = SKAction.moveBy(x: 0, y: -CGFloat( Variables.brickValue.brickSize), duration: 0.5)
                        item.run(action)
                    }
                }
            }
        }
        
        if isGameOver(deadLine: Variables.dy){

            //Create newBlock
            NextBricks().nextBrickMoveLeft()
            _ = BrickGenerator()
        }
    }
    
    
    func isbrickDownable() -> Bool{
        
        for item in Variables.brickArrays{
            let x = Int(item.x) + Variables.dx
            let y = Int(item.y) + Variables.dy
            if Variables.backarrays[y+1][x] == 2{
                return false
            }
        }
        
        return true
        }
    
    func isGameOver(deadLine: Int) -> Bool {
        if deadLine > 2{
            return true
        }
        else{
            if let scene = GameOver(fileNamed: "GameOver"){
                let transition = SKTransition.moveIn(with: .right, duration: 0.8)
                Variables.scene.view?.presentScene(scene, transition: transition)
            }
            return false
        }
    }
    
    func fire(position : CGPoint){
        let fire = SKEmitterNode(fileNamed: "Fire.sks")
        fire?.particlePosition = position
        fire?.particlePositionRange = CGVector(dx: Int(Variables.scene.frame.width) -  Variables.brickValue.brickSize * 2, dy: Variables.brickValue.brickSize)
        Variables.scene.addChild(fire!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            fire?.removeFromParent()
        }
        
    }
}
