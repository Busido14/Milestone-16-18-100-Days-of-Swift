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
    var timerLabel: SKLabelNode!
    var scoreLabel: SKLabelNode!
    var shots: SKSpriteNode!
    var shotsList = ["shots0", "shots1", "shots2", "shots3"]
    var shotsIterator = 0 {
        didSet {
            shots.removeFromParent()
            shots = SKSpriteNode(imageNamed: shotsList[shotsIterator])
            shots.position = CGPoint(x: 64, y: 32)
            shots.name = "reload"
            addChild(shots)
           
        }
    }
    
    let foods = [ "bacon", "banana", "pizza", "popcorn"]
    var isGameOver = false
    var gameTimer: Timer?
    
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
        
        timerLabel = SKLabelNode(fontNamed: "Chalkduster")
        timerLabel.text = "10 c"
        timerLabel.position = CGPoint(x: 512, y: 700)
        timerLabel.zPosition = 105
        addChild(timerLabel)
        
        shots = SKSpriteNode(imageNamed: shotsList[shotsIterator])
        shots.position = CGPoint(x: 64, y: 32)
        addChild(shots)
    
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 1000, y: 700)
        scoreLabel.horizontalAlignmentMode = .right
        addChild(scoreLabel)
        
        score = 0
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(createFoods), userInfo: nil, repeats: true)
        gameTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

    }
    @objc func updateTime() {
        
    }
        
    override func update(_ currentTime: TimeInterval) {
        
    }
    
  @objc func createFoods() {
      guard let enemy = foods.randomElement() else { return }
      
      let sprite = SKSpriteNode(imageNamed: enemy)
      sprite.position = CGPoint(x: 1200, y: Int.random(in: 50...800))
      addChild(sprite)
        
      sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
      sprite.physicsBody?.categoryBitMask = 1
      sprite.physicsBody?.velocity = CGVector(dx: -400, dy: 0)
      sprite .physicsBody?.angularVelocity = 4
      sprite.physicsBody?.linearDamping = 0
      sprite.physicsBody?.angularDamping = 1
    }
    
}
