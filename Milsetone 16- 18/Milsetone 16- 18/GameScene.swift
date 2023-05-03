//
//  GameScene.swift
//  Milsetone 16- 18
//
//  Created by Артем Чжен on 03/05/23.
//

import SpriteKit
//import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var background: SKSpriteNode!
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {

        
        background = SKSpriteNode(imageNamed: "background")
        background.xScale = 1.8
        background.yScale = 1.8
        background.position = CGPoint(x: 500, y: 400 )
        background.zPosition = -1
        addChild(background)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 1000, y: 700)
        scoreLabel.horizontalAlignmentMode = .right
        addChild(scoreLabel)
        
        score = 0
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
 
        }
        
    override func update(_ currentTime: TimeInterval) {
        
    }
}
