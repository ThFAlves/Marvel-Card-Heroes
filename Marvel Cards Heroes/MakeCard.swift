//
//  Card.swift
//  Marvel Cards Heroes
//
//  Created by Luiz Henrique Silveira Cruz Junior on 11/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import Foundation
import SpriteKit

class MakeCard : SKSpriteNode {
    
    var textureUp: SKTexture?
    var textureDown: SKTexture?
    
    var largeTexture: SKTexture!
    var largeTextureFilename: String!
    var category: String?
    
    var item = 0 // Para verificar o item da carta que foi selecionado para jogar

    var enlarged = false
    var savedPosition = CGPoint.zero
    
    var names = [String]()
    var cont_name:Int = 0
    
    var values = [String]()
    var cont_values:Int = 100
    var cont: Int = 0
    
    enum CardName: Int {
        case ha_prata = 0,
        im_ouro,     // 1
        hulk,
        viuva
        
    }
    
    init(cardNamed: String,faceUp:Bool, prize:Bool,userInteraction: Bool) {
        //cardNamed = ["Hulk", , "IronMan"]
        // initialize properties
        
        //Define a parte de TRAS DA CARTA
        textureDown = SKTexture(imageNamed: "cardBack.png")
        var texture = SKTexture()
        
        switch cardNamed {
        case "HomemAranha":
            
            if prize{
                textureUp = SKTexture(imageNamed: "cardBack.png");
                textureDown = SKTexture(imageNamed: "Homem-Aranha-Prata.png")
                
            } else{
                textureUp = SKTexture(imageNamed: "Homem-Aranha-Prata.png")
                largeTextureFilename = "Homem-Aranha-Prata.png"
                
                textureDown = SKTexture(imageNamed: "cardBack")
                largeTexture = SKTexture(imageNamed: "cardBack")
                
            }
            category = "prata.png"
        case "IronMan":
            textureUp = SKTexture(imageNamed: "Iron-Man-Ouro.png")
            largeTextureFilename = "Iron-Man-Ouro.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        case "SenhordasEstrelas":
            textureUp = SKTexture(imageNamed: "Senhor das Estrelas.png")
            largeTextureFilename = "Senhor das Estrelas.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        case "NickFury":
            textureUp = SKTexture(imageNamed: "Nick Fury-Prize.png")
            largeTextureFilename = "Nick Fury-Prize.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        case "Lagarto":
            textureUp = SKTexture(imageNamed: "Lagarto.png")
            largeTextureFilename = "Lagarto.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
            //OURO
        case "Vision":
            textureUp = SKTexture(imageNamed: "Visao.png")
            largeTextureFilename = "Visao.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Visao.png")
        case "Deadpool":
            textureUp = SKTexture(imageNamed: "Deadpool.png")
            largeTextureFilename = "Deadpool.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Deadpool.png")
        case "Thor":
            textureUp = SKTexture(imageNamed: "Thor.png")
            largeTextureFilename = "Thor.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Thor.png")
        case "Red Hulk":
            textureUp = SKTexture(imageNamed: "Red Hulk.png")
            largeTextureFilename = "Red Hulk.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Red Hulk.png")
        case "Loki":
            textureUp = SKTexture(imageNamed: "Loki.png")
            largeTextureFilename = "Loki.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Loki.png")
        case "Iron Man":
            textureUp = SKTexture(imageNamed: "Homem de Ferro.png")
            largeTextureFilename = "Homem de Ferro.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Homem de Ferro.png")
        case "Doctor Strange":
            textureUp = SKTexture(imageNamed: "Doctor Strange.png")
            largeTextureFilename = "Doctor Strange.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Doctor Strange.png")
        case "War Machine":
            textureUp = SKTexture(imageNamed: "War Machine.png")
            largeTextureFilename = "War Machine.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "War Machine.png")
        case "Hulk":
            textureUp = SKTexture(imageNamed: "Hulk.png")
            largeTextureFilename = "Hulk.png"
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
            //Prata
        case "Wolverine":
            textureUp = SKTexture(imageNamed: "Wolverine.png")
            largeTextureFilename = "Wolverine.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Wolverine")
            
        case "JeanGray":
            textureUp = SKTexture(imageNamed: "JeanGray.png")
            largeTextureFilename = "Hulk.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "JeanGray.png")
            
        case "Venom":
            textureUp = SKTexture(imageNamed: "Venom.png")
            largeTextureFilename = "Venom.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Venom.png")

        case "Cyclops":
            textureUp = SKTexture(imageNamed: "Ciclope.png")
            largeTextureFilename = "Ciclope.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Ciclope.png")
        case "Spider-man":
            textureUp = SKTexture(imageNamed: "Spider-man.png")
            largeTextureFilename = "Spider-man.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Spider-man.png")
        case "Quicksilver":
            textureUp = SKTexture(imageNamed: "Quicksilver.png")
            largeTextureFilename = "Quicksilver.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Quicksilver.png")
        case "Ant-man":
            textureUp = SKTexture(imageNamed: "Ant-man.png")
            largeTextureFilename = "Ant-man.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Ant-man.png")
        case "Elektra":
            textureUp = SKTexture(imageNamed: "ViuvaNegra.png")
            largeTextureFilename = "ViuvaNegra.png"
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
            //Bronze
            
        case "Quill":
            textureUp = SKTexture(imageNamed: "Quill.png")
            largeTextureFilename = "Quill.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Quill.png")
        case "Captain America":
            textureUp = SKTexture(imageNamed: "Captain America.png")
            largeTextureFilename = "Captain America.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Captain America.png")

        case "Nightcrawler":
            textureUp = SKTexture(imageNamed: "Noturno.png")
            largeTextureFilename = "Noturno.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Noturno.png")

        case "Daredevil":
            textureUp = SKTexture(imageNamed: "Demolidor.png")
            largeTextureFilename = "Demolidor.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Demolidor.png")

        case "3D-Man":
            textureUp = SKTexture(imageNamed: "3D-Man.png")
            largeTextureFilename = "3D-Man.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "3D-Man.png")

        case "Nick Fury":
            textureUp = SKTexture(imageNamed: "Nick Fury.png")
            largeTextureFilename = "Nick Fury.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Nick Fury.png")

        case "Lizard":
            textureUp = SKTexture(imageNamed: "Lizard.png")
            largeTextureFilename = "Lizard.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Lizard.png")

        case "Winter Soldier":
            textureUp = SKTexture(imageNamed: "Winter Soldier.png")
            largeTextureFilename = "Winter Soldier.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Winter Soldier.png")

        case "item":
            textureUp = SKTexture(imageNamed: "hulk.png")
            category = "item"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
            
        default:
            print("Entrei defaut")
            textureUp = SKTexture(imageNamed: "ViuvaNegra.png")
            largeTextureFilename = "ViuvaNegra.png"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        }
        
        if faceUp{
            texture = textureDown!
        }else{
            texture = textureUp!
        }
        
        super.init(texture: texture, color: .black, size: textureUp!.size())

        // call designated initializer on super
//        super.init(texture: texture, size: textureUp!.size())
        
        // set properties defined in super
//        isUserInteractionEnabled = userInteraction
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*func flip() {
    if faceUp {
    self.texture = self.backTexture
    if let damageLabel = self.childNodeWithName("damageLabel") {
    damageLabel.hidden = true
    }
    self.faceUp = false
    } else {
    self.texture = self.frontTexture
    if let damageLabel = self.childNodeWithName("damageLabel") {
    damageLabel.hidden = false
    }
    self.faceUp = true
    }
    }*/
    
    //func flip(face:Bool) {
    
    
    
    
    func flip(face:Bool, completion: (() -> Void)?) {
        let firstHalfFlip = SKAction.scaleX(to: 0.0, duration: 0.6)
        let secondHalfFlip = SKAction.scaleX(to: 1.0, duration: 0.6)
        
        setScale(1.0)
        
        /*let completionAction = SKAction.runBlock { () -> Void in
        if let completionFunction = completion {
        completionFunction()
        }
        }*/
        var itens = ["itemForca","itemInteligencia","itemVelocidade","itemResistencia","itemPoder","itemCombate"]
        if face {
            run(firstHalfFlip) {
                self.texture = self.textureDown
                if let damageLabel = self.childNode(withName: "damageLabel") {
                    damageLabel.isHidden = true
                }
                for i in 0...itens.count - 1{
                    if let powerLabel = self.childNode(withName: itens[i]) {
                        powerLabel.isHidden = true
                    }
                }
                
                for i in 0...self.names.count - 1{
                    if let nameLabel = self.childNode(withName: self.names[i]) {
                        //nameLabel.hidden = true
                    }
                }
                
                for i in 0...self.values.count - 1{
                    if let valueLabel = self.childNode(withName: self.values[i]) {
                        valueLabel.isHidden = true
                    }
                }
                //self.faceUp = false
                //self.runAction(secondHalfFlip)
                self.run(secondHalfFlip, completion: completion!)
                
            }
        } else {
            run(firstHalfFlip) {
                self.texture = self.textureUp
                
                if let damageLabel = self.childNode(withName: "damageLabel") {
                    damageLabel.isHidden = false
                }
                for i in 0...itens.count - 1{
                    if let powerLabel = self.childNode(withName: itens[i]) {
                        powerLabel.isHidden = false
                        powerLabel.zPosition = 20
                    }
                }
                
                for i in 0...self.names.count - 1{
                    if let nameLabel = self.childNode(withName: self.names[i]) {
                        nameLabel.isHidden = false
                        nameLabel.zPosition = 21
                    }
                }
                
                for i in 0...self.values.count - 1{
                    if let valueLabel = self.childNode(withName: self.values[i]) {
                        valueLabel.isHidden = false
                    }
                }
                
                //self.faceUp = true
                self.run(secondHalfFlip, completion: completion!)
            }
        }
    }
    
    func flipCard(faceUp:Bool){
        let itens = ["itemForca","itemInteligencia","itemVelocidade","itemResistencia","itemPoder","itemCombate"]
        if faceUp{
            
            self.texture = textureDown
            for i in 0...itens.count - 1{
                if let powerLabel = self.childNode(withName: itens[i]) {
                    powerLabel.isHidden = true
                }
            }
            for i in 0...names.count - 1{
                if let nameLabel = self.childNode(withName: names[i]) {
                    nameLabel.isHidden = true
                }
            }
            
            for i in 0...values.count - 1{
                if let valueLabel = self.childNode(withName: values[i]) {
                    valueLabel.isHidden = true
                }
            }
            
        }else{
            self.texture = textureUp
            for i in 0...itens.count - 1{
                if let powerLabel = self.childNode(withName: itens[i]) {
                    powerLabel.isHidden = false
                }
            }
            
            for i in 0...names.count - 1{
                if let nameLabel = self.childNode(withName: names[i]) {
                    nameLabel.isHidden = false
                }
            }
            
            for i in 0...values.count - 1{
                if let valueLabel = self.childNode(withName: values[i]) {
                    valueLabel.isHidden = false
                }
            }
        }
    }
    
    
    func flipPrize(face:Bool, completion: (() -> Void)?) {
        let firstHalfFlip = SKAction.scaleX(to: 0.0, duration: 0.6)
        let secondHalfFlip = SKAction.scaleX(to: 1.0, duration: 0.6)
        
        setScale(1.0)
        
        /*let completionAction = SKAction.runBlock { () -> Void in
        if let completionFunction = completion {
        completionFunction()
        }
        }*/
        
        if face {
            run(firstHalfFlip) {
                self.texture = self.textureDown
                
                //self.faceUp = false
                //self.runAction(secondHalfFlip)
                self.run(secondHalfFlip, completion: completion!)
                
            }
        } else {
            run(firstHalfFlip) {
                self.texture = self.textureUp
                
                
                
                //self.faceUp = true
                self.run(secondHalfFlip, completion: completion!)
            }
        }
    }
    
    
    
    func enlarge() {
        if enlarged {
            let slide = SKAction.move(to: savedPosition, duration:0.3)
            let scaleDown = SKAction.scale(to: 1.0, duration:0.3)
            run(SKAction.group([slide, scaleDown])) {
                self.enlarged = false
                self.zPosition = 0
            }
        } else {
            //ESTADO:EXPANDIDO
            enlarged = true
            savedPosition = position
            
            if largeTexture != nil {
                texture = largeTexture
            } else {
                largeTexture = SKTexture(imageNamed: largeTextureFilename)
                texture = largeTexture
            }
            
            zPosition = 20
            
            let newPosition = CGPoint(x: parent!.frame.midX, y: parent!.frame.midY)
            removeAllActions()
            
            let slide = SKAction.move(to: newPosition, duration:0.3)
            let scaleUp = SKAction.scale(to: 1.8, duration:0.3)
            run(SKAction.group([slide, scaleUp]))
        }
    }
    ////
    
    //Importante
    
    ////
    func itemAnimated(cards:SKNode){
        
        //let scale = SKAction.scaleBy(2.5, duration: 0.3)
        let focus = SKAction.colorize(with: UIColor.green, colorBlendFactor: 1, duration: 0.3)
        
        //let move = SKAction.moveTo(CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)), duration: 1.0)
        cards.run(focus)
        
    }
    
    func limpaItemAnimated() {
        item = 0
    }
    
    func okToAnimateGame(nameItem: String) {
        
        // var player1deck =  GameScene.player1Deck()
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var gameScene = self.scene as! GameScene
        
        for touch in touches {
            
            let locationItem = (touch as! UITouch).location(in: self)
            let itemCard = self.atPoint(locationItem)
            var itemCardP2 = itemCard
            //itemCardP2.position.x = itemCard.position.x - 600
            
            
            if itemCard.name == "itemForca"
            {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: itemCard.name!, card: itemCard)
                item = 1
            }
            if itemCard.name == "itemInteligencia"
            {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: itemCard.name!, card: itemCard)
                
                item = 1
            }
            if itemCard.name == "itemVelocidade"
            {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: itemCard.name!, card: itemCard)
                
                item = 1
            }
            if itemCard.name == "itemResistencia"
            {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: itemCard.name!, card: itemCard)
                
                item = 1
            }
            if itemCard.name == "itemPoder"
            {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: itemCard.name!, card: itemCard)
                
                item = 1
            }
            if itemCard.name == "itemCombate"
            {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: itemCard.name!, card: itemCard)
                
                item = 1
            }
        }
        
    }
    
    func newDamageLabel() -> SKLabelNode {
        let damageLabel = SKLabelNode(fontNamed: "OpenSans-Bold")
        damageLabel.name = "damageLabel"
        damageLabel.fontSize = 14
        
        damageLabel.fontColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        damageLabel.text = "83"
        damageLabel.position = CGPoint(x: 200, y: 200)
        
        return damageLabel
    }
    
    
    ///ADD label, util para fazer os pontos das cartas se alterarem
    
    //Font necessaria Helvetica-Oblique
    
    
    
    func newPower(height:CGFloat,nome: String,itemImage: String, posz:Int) -> SKSpriteNode {
        
        let power = SKSpriteNode(imageNamed: itemImage)
        
        power.size.height = 34
        power.size.width = 270
        power.position.x = -4
        power.position.y = height
        power.name = nome
        power.zPosition = CGFloat(posz)
        return power
    }
    
    func namePower(height:CGFloat,nome: String, posz: Int) ->SKLabelNode
    {
        let name = SKLabelNode(fontNamed: "American_Captain")
        
        names.append(String(cont_name))
        
        name.name = names[cont_name]
        cont_name += 1
        
        name.text = nome
        name.position.y = height
        name.position.x = -40
        name.fontSize = 18
        name.zPosition = 20
        return name
    }
    
    func valuePower(height:CGFloat,text: NSNumber, posz: Int, ajuste: Int) ->SKLabelNode
    {
        let value = SKLabelNode(fontNamed: "Arial")
        values.append(String(cont_values))
        value.name = values[cont]
        cont_values += 1
        cont += 1
        
        value.text = text.stringValue
        value.position.y = height
        value.position.x = 50
        value.fontSize = 18
        value.zPosition = CGFloat(posz + ajuste)
        return value
    }
    var ine:Int = 14
    
    func heroName(height:CGFloat,nome: String, posz: Int) ->SKLabelNode
    {
        ine += 1
        let hero = SKLabelNode(fontNamed: "Arial")
        hero.text = nome
        hero.position.y = height
        hero.position.x = -30
        hero.fontSize = 12
        hero.zPosition = CGFloat(ine)
        return hero
    }
    
}

