//
//  Variables.swift
//  TetrisGame
//
//  Created by Matthew Lee on 30/08/2020.
//  Copyright © 2020 Matthew Lee. All rights reserved.
//

import Foundation
import SpriteKit

struct Variables {
    static var backarrays = [[Int]]()
    static var scene = SKScene()
    static var brickValue = Brick().bricks()
    static var dx = 4
    static var dy = 2
    static let gab = 1
    static var startPoint = CGPoint()
    static var brickArrays = Array<CGPoint>()
    static var brickNode = Array<SKSpriteNode>()
    static var blockedArrays = Array<SKSpriteNode>()
    static var isPause = false
    static var nodeGroup = [[SKSpriteNode]]()
    static var newBrickArrays = [Brick.Bricks]()
    static let row = 10
    static let col = 20
}
