import Foundation
import SpriteKit

enum MakeCardType: String {
    case forca = "itemForca"
    case iteligencia = "itemInteligencia"
    case velocidade = "itemVelocidade"
    case resistencia = "itemResistencia"
    case poder = "itemPoder"
    case combate = "itemCombate"
}

// swiftlint:disable all
class MakeCard: SKSpriteNode {
    
    var textureUp: SKTexture?
    var textureDown: SKTexture?
    var largeTexture: SKTexture!
    var largeTextureFilename: String!
    var category: String?
    
    var item = 0 // Para verificar o item da carta que foi selecionado para jogar

    var enlarged = false
    var savedPosition = CGPoint.zero
    
    var names = [String]()
    var contName: Int = 0
    
    var values = [String]()
    var contValues: Int = 100
    var cont: Int = 0
    
    enum CardName: Int {
        case haPrata = 0,
        imOuro,     // 1
        hulk,
        viuva
        
    }
    
    init(cardNamed: String, faceUp: Bool, prize:Bool, userInteraction: Bool) {
        //Define a parte de TRAS DA CARTA
        textureDown = SKTexture(imageNamed: "cardBack.png")
        var texture = SKTexture()
        
        var nameHero = ""
        
        switch cardNamed {
        case "HomemAranha":
            
            if prize {
                textureUp = SKTexture(imageNamed: "cardBack.png")
                textureDown = SKTexture(imageNamed: "Homem-Aranha-Prata.png")
            } else {
                textureUp = SKTexture(imageNamed: "Homem-Aranha-Prata.png")
                largeTextureFilename = "Homem-Aranha-Prata.png"
                
                textureDown = SKTexture(imageNamed: "cardBack")
                largeTexture = SKTexture(imageNamed: "cardBack")
                
            }
            category = "prata.png"
        case "IronMan":
            textureUp = SKTexture(imageNamed: "Iron-Man-Ouro.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        case "SenhordasEstrelas":
            textureUp = SKTexture(imageNamed: "Senhor das Estrelas.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        case "NickFury":
            textureUp = SKTexture(imageNamed: "Nick Fury-Prize.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        case "Lagarto":
            textureUp = SKTexture(imageNamed: "Lagarto.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
            //OURO
        case "Vision":
            textureUp = SKTexture(imageNamed: "Visao.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Visao.png")
        case "Deadpool":
            textureUp = SKTexture(imageNamed: "Deadpool.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Deadpool.png")
        case "Thor":
            textureUp = SKTexture(imageNamed: "Thor.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Thor.png")
        case "Red Hulk":
            textureUp = SKTexture(imageNamed: "Red Hulk.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Red Hulk.png")
        case "Loki":
            textureUp = SKTexture(imageNamed: "Loki.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Loki.png")
        case "Iron Man":
            textureUp = SKTexture(imageNamed: "Homem de Ferro.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Homem de Ferro.png")
        case "Doctor Strange":
            textureUp = SKTexture(imageNamed: "Doctor Strange.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Doctor Strange.png")
        case "War Machine":
            textureUp = SKTexture(imageNamed: "War Machine.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "War Machine.png")
        case "Hulk":
            textureUp = SKTexture(imageNamed: "Hulk.png")
            category = "ouro.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
            //Prata
        case "Wolverine":
            textureUp = SKTexture(imageNamed: "Wolverine.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Wolverine")
        case "JeanGray":
            textureUp = SKTexture(imageNamed: "JeanGray.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "JeanGray.png")
            
        case "Venom":
            textureUp = SKTexture(imageNamed: "Venom.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Venom.png")

        case "Cyclops":
            textureUp = SKTexture(imageNamed: "Ciclope.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Ciclope.png")
        case "Spider-man":
            textureUp = SKTexture(imageNamed: "Spider-man.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Spider-man.png")
        case "Quicksilver":
            textureUp = SKTexture(imageNamed: "Quicksilver.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Quicksilver.png")
        case "Ant-man":
            textureUp = SKTexture(imageNamed: "Ant-man.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Ant-man.png")
        case "Elektra":
            textureUp = SKTexture(imageNamed: "ViuvaNegra.png")
            category = "prata.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
            //Bronze
            
        case "Quill":
            textureUp = SKTexture(imageNamed: "Quill.png")
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Quill.png")
        case "Captain America":
            textureUp = SKTexture(imageNamed: "Captain America.png")
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Captain America.png")
        case "Nightcrawler":
            textureUp = SKTexture(imageNamed: "Noturno.png")
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Noturno.png")
        case "Daredevil":
            textureUp = SKTexture(imageNamed: "Demolidor.png")
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Demolidor.png")
        case "3D-Man":
            textureUp = SKTexture(imageNamed: "3D-Man.png")
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "3D-Man.png")
        case "Nick Fury":
            nameHero = "Nick Fury"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Nick Fury.png")
        case "Lizard":
            nameHero = "Lizard"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Lizard.png")

        case "Winter Soldier":
            nameHero = "Winter Soldier"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "Winter Soldier.png")
        case "item":
            nameHero = "hulk"
            category = "item"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        default:
            nameHero = "ViuvaNegra"
            category = "bronze.png"
            textureDown = SKTexture(imageNamed: "cardBack")
            largeTexture = SKTexture(imageNamed: "cardBack")
        }
        
        textureUp = SKTexture(imageNamed: "\(nameHero).png")
        largeTextureFilename = "\(nameHero).png"
        
        if faceUp {
            texture = textureDown!
        } else {
            texture = textureUp!
        }
        
        super.init(texture: texture, color: .black, size: textureUp!.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flip(face:Bool, completion: (() -> Void)?) {
        let firstHalfFlip = SKAction.scaleX(to: 0.0, duration: 0.6)
        let secondHalfFlip = SKAction.scaleX(to: 1.0, duration: 0.6)
        
        setScale(1.0)

        let itens  = ["itemForca","itemInteligencia","itemVelocidade","itemResistencia","itemPoder","itemCombate"]
        if face {
            run(firstHalfFlip) {
                self.texture = self.textureDown
                if let damageLabel = self.childNode(withName: "damageLabel") {
                    damageLabel.isHidden = true
                }
                for count in 0...itens.count - 1{
                    if let powerLabel = self.childNode(withName: itens[count]) {
                        powerLabel.isHidden = true
                    }
                    if let valueLabel = self.childNode(withName: self.values[count]) {
                        valueLabel.isHidden = true
                    }
                }
                self.run(secondHalfFlip, completion: completion!)
            }
        } else {
            run(firstHalfFlip) {
                self.texture = self.textureUp
                
                if let damageLabel = self.childNode(withName: "damageLabel") {
                    damageLabel.isHidden = false
                }
                for count in 0...itens.count - 1{
                    if let powerLabel = self.childNode(withName: itens[count]) {
                        powerLabel.isHidden = false
                        powerLabel.zPosition = 20
                    }
                    if let nameLabel = self.childNode(withName: self.names[count]) {
                        nameLabel.isHidden = false
                        nameLabel.zPosition = 21
                    }
                    if let valueLabel = self.childNode(withName: self.values[count]) {
                        valueLabel.isHidden = false
                    }
                }
                self.run(secondHalfFlip, completion: completion!)
            }
        }
    }
    
    func flipCard(faceUp: Bool) {
        let itens = ["itemForca", "itemInteligencia", "itemVelocidade", "itemResistencia", "itemPoder", "itemCombate"]
        self.texture = faceUp ? textureDown: textureUp
            for count in 0...itens.count - 1 {
                if let powerLabel = self.childNode(withName: itens[count]) {
                    powerLabel.isHidden = faceUp
                }
                if let nameLabel = self.childNode(withName: names[count]) {
                    nameLabel.isHidden = faceUp
                }
                if let valueLabel = self.childNode(withName: values[count]) {
                    valueLabel.isHidden = faceUp
                }
            }
    }
    
    func flipPrize(face: Bool, completion: (() -> Void)?) {
        let firstHalfFlip = SKAction.scaleX(to: 0.0, duration: 0.6)
        let secondHalfFlip = SKAction.scaleX(to: 1.0, duration: 0.6)
        
        setScale(1.0)
        
        run(firstHalfFlip) {
            self.texture = face ? self.textureDown: self.textureUp
            self.run(secondHalfFlip, completion: completion!)
        }
    }
    
    func enlarge() {
        if enlarged {
            let slide = SKAction.move(to: savedPosition, duration: 0.3)
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
    
    func itemAnimated(cards: SKNode){
        let focus = SKAction.colorize(with: UIColor.green, colorBlendFactor: 1, duration: 0.3)
        cards.run(focus)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let gameScene = self.scene as? GameScene else {
            return
        }
        
        for touch in touches {
            
            let locationItem = touch.location(in: self)
            let itemCard = self.atPoint(locationItem)
            
            if itemCard.name == "itemForca" {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: .forca, card: itemCard)
                item = 1
            } else if itemCard.name == "itemInteligencia" {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: .iteligencia, card: itemCard)
                
                item = 1
            } else if itemCard.name == "itemVelocidade" {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: .velocidade, card: itemCard)
                
                item = 1
            } else if itemCard.name == "itemResistencia" {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: .resistencia, card: itemCard)
                
                item = 1
            } else if itemCard.name == "itemPoder" {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: .poder, card: itemCard)
                
                item = 1
            } else if itemCard.name == "itemCombate" {
                itemAnimated(cards: itemCard)
                gameScene.animateGame(nomeItem: .combate, card: itemCard)
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
    func newPower(height: Int, name: String, itemImage: String, posz: Int) -> SKSpriteNode {
        
        let power = SKSpriteNode(imageNamed: itemImage)
        
        power.size.height = 34
        power.size.width = 270
        power.position.x = -4
        power.position.y = CGFloat(height)
        power.name = name
        power.zPosition = CGFloat(posz)
        return power
    }
    
    func namePower(height: Float, nome: String, posz: Int) -> SKLabelNode {
        let name = SKLabelNode(fontNamed: "American_Captain")
        
        names.append(String(contName))
        
        name.name = names[contName]
        contName += 1
        
        name.text = nome
        name.position.y = CGFloat(height)
        name.position.x = -40
        name.fontSize = 18
        name.zPosition = 20
        return name
    }
    
    func valuePower(height: Float, text: String, posz: Int, ajuste: Int) -> SKLabelNode {
        let value = SKLabelNode(fontNamed: "Arial")
        values.append(String(contValues))
        value.name = values[cont]
        contValues += 1
        cont += 1
        
        value.text = text
        value.position.y = CGFloat(height)
        value.position.x = 50
        value.fontSize = 18
        value.zPosition = CGFloat(posz + ajuste)
        return value
    }
    var ine: Int = 14
    
    func heroName(height: Float, name: String, posz: Int) -> SKLabelNode {
        ine += 1
        let hero = SKLabelNode(fontNamed: "Arial")
        hero.text = name
        hero.position.y = CGFloat(height)
        hero.position.x = -30
        hero.fontSize = 12
        hero.zPosition = CGFloat(ine)
        return hero
    }
}
