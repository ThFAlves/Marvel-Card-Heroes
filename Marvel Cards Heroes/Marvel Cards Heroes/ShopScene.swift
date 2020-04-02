//
//  ShopScene.swift
//  Marvel Cards Heroes
//
//  Created by Luiz Henrique Silveira Cruz Junior on 14/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import SpriteKit

class ShopScene: SKScene {

    var frontTexture: SKTexture!
    var backTexture: SKTexture!
    var largeTexture: SKTexture!
    var largeTextureFilename: String!

    //Flip Card
    var faceUp = false
    var enlarged = false
    var savedPosition = CGPoint.zero

    //1-Bronze 2-Prata 3-Ouro 4-Legendaria
    init(size: CGSize, type: Int) {
        super.init(size: size)

        //self.backgroundColor = SKColor.clearColor()
        let delay = SKAction.wait(forDuration: 2.0)
        let goAway = SKAction.moveTo(x: 2000, duration: 3.0)

        let bgImage = SKSpriteNode(imageNamed: "Background.png")
        bgImage.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(bgImage)

        //dealCards()

        let centerCard = MakeCard(cardNamed: "Lagarto",faceUp:true, prize: true, userInteraction: false)

        centerCard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

        centerCard.size.height = 400
        centerCard.size.width = 250
        self.addChild(centerCard)

        let newX3:CGFloat = centerCard.position.x

        let move3 = SKAction.moveTo(x: newX3, duration: 1.0)

        let sequence3 = SKAction.sequence([move3,delay,goAway])

        centerCard.run(sequence3)

        let removedCard = MakeCard(cardNamed: "SenhordasEstrelas",faceUp:true, prize: true, userInteraction: false)

        removedCard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        removedCard.size.height = 400
        removedCard.size.width = 250
        self.addChild(removedCard)

        let newX:CGFloat = removedCard.position.x + removedCard.frame.width + removedCard.frame.width/3

        let move = SKAction.moveTo(x: newX, duration: 1.0)

        let sequence = SKAction.sequence([move,delay,goAway])
        removedCard.run(sequence)

        let removedCard2 = MakeCard(cardNamed: "NickFury",faceUp:true, prize: true, userInteraction: false)

        removedCard2.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        removedCard2.size.height = 400
        removedCard2.size.width = 250
        self.addChild(removedCard2)

        let newX2:CGFloat = removedCard.position.x - removedCard.frame.width - removedCard.frame.width/3

        let move2 = SKAction.moveTo(x: newX2, duration: 1.0)

        let sequence2 = SKAction.sequence([move2,delay,goAway])
        removedCard2.run(sequence2)

        removedCard2.flipPrize(face: false, completion: nil)
        centerCard.flipPrize(face: false, completion: nil)
        removedCard.flipPrize(face: false, completion: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func dealCards() {
        let removedCard = SKSpriteNode(imageNamed: "cardBack")

        removedCard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        removedCard.size.height = 400
        removedCard.size.width = 250
        self.addChild(removedCard)
        //removedCard.flip()

        let newX:CGFloat = removedCard.position.x + removedCard.frame.width * 2

        let move = SKAction.moveTo(x: newX, duration: 2.0)
        removedCard.run(move)

        let removedCard2 = SKSpriteNode(imageNamed: "cardBack")

        removedCard2.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        removedCard2.size.height = 400
        removedCard2.size.width = 250
        self.addChild(removedCard2)

        //removedCard.flip()
        removedCard2.run(move)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touch = touches.first!
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            touchedNode.zPosition = 15

            //Animacao das Cartas

            let liftUp = SKAction.scale(to: 1.2, duration: 0.2)
            touchedNode.run(liftUp, withKey: "pickup")

            if touch.tapCount > 1 {
                touchedNode.run(SKAction.rotate(toAngle: 0, duration: 0.2))
            }

            if enlarged { return }

            let rotR = SKAction.rotate(byAngle: 0.15, duration: 0.2)
            let rotL = SKAction.rotate(byAngle: -0.15, duration: 0.2)
            let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
            _ = SKAction.repeatForever(cycle)
            //touchedNode.runAction(wiggle, withKey: "wiggle")

            let move2 = SKAction.moveTo(x: 2000, duration: 2.0)

            touchedNode.run(move2)
        }
    }
}
