//
//  GameOver.swift
//  TetrisGame
//
//  Created by Matthew Lee on 31/08/2020.
//  Copyright © 2020 Matthew Lee. All rights reserved.
//

import Foundation
import SpriteKit

class GameOver : SKScene{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        let node = nodes(at: location!)
        for item in node{
            if item.name == "restart"{
                let scene = GameScene(size: view!.frame.size)
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    scene.anchorPoint = CGPoint(x: 0, y: 1)
                let transition = SKTransition.moveIn(with: .left, duration: 0.8)
                    // Present the scene
                    view!.presentScene(scene, transition: transition)

            }
        }
    }
}
