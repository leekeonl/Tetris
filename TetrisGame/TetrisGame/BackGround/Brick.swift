//
//  Brick.swift
//  TetrisGame
//
//  Created by Matthew Lee on 30/08/2020.
//  Copyright © 2020 Matthew Lee. All rights reserved.
//

import Foundation
import SpriteKit

class Brick{
    struct Bricks {
        var color = UIColor()
        var points = Array<CGPoint>()
        let brickSize = 35
        let zPosition = CGFloat(1)
        var brickName = String()
        
        
    }
    
    //when 0, can move, when 1 , cannot move
    func bricks() -> Bricks{
        var bricks = [Bricks]()

//        brick1, T-shape
        var brick1 = [CGPoint]()
        brick1.append(CGPoint(x: 0, y: 0))
        brick1.append(CGPoint(x: 1, y: 0))
        brick1.append(CGPoint(x: -1, y: 0))
        brick1.append(CGPoint(x: 0, y: 1))
        bricks.append(Bricks(color: .red, points: brick1, brickName: "brick1"))
        
        //        brick2,  -- -shape
        var brick2 = [CGPoint]()
        brick2.append(CGPoint(x: -1, y: 0))
        brick2.append(CGPoint(x: 0, y: 0))
        brick2.append(CGPoint(x: 1, y: 0))
        brick2.append(CGPoint(x: 2, y: 0))
        bricks.append(Bricks(color: .cyan, points: brick2, brickName: "brick2"))
        
        // brick 3 _l- shape
        var brick3 = [CGPoint]()
        brick3.append(CGPoint(x: 0, y: 0))
        brick3.append(CGPoint(x: 1, y: 0))
        brick3.append(CGPoint(x: 0, y: 1))
        brick3.append(CGPoint(x: -1, y: 1))
        bricks.append(Bricks(color: .green, points: brick3, brickName: "brick3"))
        
        // brick 4 L shape
        var brick4 = [CGPoint]()
        brick4.append(CGPoint(x: -1, y: 1))
        brick4.append(CGPoint(x: -1, y: 0))
        brick4.append(CGPoint(x: 0, y: 0))
        brick4.append(CGPoint(x: 1, y: 0))
        bricks.append(Bricks(color: .purple, points: brick4, brickName: "brick4"))
        
        // brick 5 square shape
        var brick5 = [CGPoint]()
        brick5.append(CGPoint(x: 1, y: 0))
        brick5.append(CGPoint(x: 0, y: 0))
        brick5.append(CGPoint(x: 0, y: 1))
        brick5.append(CGPoint(x: 1, y: 1))
        bricks.append(Bricks(color: .orange, points: brick5, brickName: "brick5"))
        
        // brick 6 anti L shape
        var brick6 = [CGPoint]()
        brick6.append(CGPoint(x: 1, y: 1))
        brick6.append(CGPoint(x: -1, y: 0))
        brick6.append(CGPoint(x: 0, y: 0))
        brick6.append(CGPoint(x: 1, y: 0))
        bricks.append(Bricks(color: .yellow, points: brick6, brickName: "brick6"))
        
        
        // brick 3 anti _l- shape
        var brick7 = [CGPoint]()
        brick7.append(CGPoint(x: 0, y: 0))
        brick7.append(CGPoint(x: -1, y: 0))
        brick7.append(CGPoint(x: 0, y: 1))
        brick7.append(CGPoint(x: 1, y: 1))
        bricks.append(Bricks(color: .systemPink, points: brick7, brickName: "brick7"))
        
        let random = Int.random(in:0..<7)
        return bricks[random]
    }
    
}
