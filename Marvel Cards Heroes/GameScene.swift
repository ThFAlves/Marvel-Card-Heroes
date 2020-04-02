import SpriteKit

// swiftlint:disable all
class GameScene: SKScene {
    
    var deck = [MakeCard]()
    var deckCPU = [MakeCard]()
    //Players e o vetor do deck de cada player
    var player1Cards = [MakeCard]()
    var player2Cards = [MakeCard]()
    
    var player1Turn = true
    var player2Turn = false
    
    var player1CardsPositions = [CGPoint]()
    var player2CardsPositions = [CGPoint]()
    
    var jogada = 1
    var user = 1
    var cpu = 1
    let cardOffSet = CGFloat(35)
    let sides : CGFloat = 50
    
    
    //Game variables
    
    var player1PlayingPosition = CGPoint()
    var player1PlayingCard = [MakeCard]()
    
    var player2PlayingPosition = CGPoint()
    var player2PlayingCard = [MakeCard]()
    
    var player1Label = SKLabelNode()
    var player2Label = SKLabelNode()
    var player1ScoreLabel = SKLabelNode()
    var player2ScoreLabel = SKLabelNode()
    
    
    
    var player1Score : Int = 0
    var player2Score : Int = 0
    
    var currentPlayer: Int = 0
    
    var gameInProgress: Bool = false
    var canPlayHearts: Bool = false
    
    var currentMoveCards = [MakeCard]()
    
    
    
    override init(size: CGSize) {
        super.init(size: size)
        //self.backgroundColor = UIColor.grayColor()
        
        let bgImage = SKSpriteNode(imageNamed: "black_board.png")
        bgImage.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(bgImage)
        //bronze-prata-ouro-legendaria
        
        //self.suits = ["spade","heart","diamond","club"]
        
        dealCards()
        
        let centerCard = SKSpriteNode(imageNamed: "cardBack")
        centerCard.size.height = 400
        centerCard.size.width = 250
        centerCard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)

        let newX = centerCard.position.x - centerCard.size.width/2 - self.cardOffSet - centerCard.size.width/2
        let newY = centerCard.position.y
        
        player1PlayingPosition = CGPoint(x: newX, y: newY)

        let newX2 = centerCard.position.x + centerCard.size.width/2 - self.cardOffSet - centerCard.size.width/2
        let newY2 = centerCard.position.y
        
        player2PlayingPosition = CGPoint(x: newX2, y: newY2)
        
        //Label Nodes
        
        player1Label = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        player1Label.fontColor = UIColor.brown
        player1Label.fontSize = 40
        player1Label.text = "1"
        
        player1Label.position = CGPoint(x: self.frame.midX - player1Label.frame.width/2, y: sides/2 - player1Label.frame.height/2)

        player1Label = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        player1Label.fontColor = .brown
        player1Label.fontSize = 40
        player1Label.text = "Jogador 1"
        
        player1Label.position = CGPoint(x: 200, y: self.frame.midY + player1Label.frame.height/2 - 320)
        self.addChild(player1Label)

        player2Label = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        player2Label.fontColor = UIColor.brown
        player2Label.fontSize = 40
        player2Label.text = "CPU"
        
        player2Label.position = CGPoint(x: self.frame.width - sides/2 - 150, y: self.frame.midY + player2Label.frame.height/2 - 320)
        self.addChild(player2Label)
        
        
        //Player Score Labels
        
        
        player1ScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
        player2ScoreLabel = SKLabelNode(fontNamed: "Courier-Bold")
        
        
        player1ScoreLabel.fontSize = 25
        player2ScoreLabel.fontSize = 25
        
        
        player1ScoreLabel.fontColor = SKColor.white
        player2ScoreLabel.fontColor = SKColor.white
        
        
        player1ScoreLabel.text = "Score:\(player1Score)"
        player2ScoreLabel.text = "Score:\(player2Score)"
        
        player1ScoreLabel.position = CGPoint(x: sides + centerCard.frame.width + cardOffSet + player1ScoreLabel.frame.width/2 + 55, y: self.frame.midY)
        
        player2ScoreLabel.position = CGPoint(x: self.size.width - sides - centerCard.size.width - player2ScoreLabel.frame.width/2 - 90,y: self.frame.midY)
        
        self.addChild(player1ScoreLabel)
        self.addChild(player2ScoreLabel)
    }
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    
    
    
    func player1Win(){
        
        
        
        let l1 = SKLabelNode()
        
        l1.text = "GANHOU"
        l1.position.y = 100
        l1.position.x = -30
        l1.fontSize = 12
        l1.zPosition = 20
        
        
        l1.fontName = "AVENGEANCE"
        l1.fontSize = 86
        scene!.addChild(l1)
        let move = SKAction.move(to: CGPoint(x: self.frame.midX,y: (self.frame.midY + 220)), duration: 0.1)
        
        l1.run(move)
        
        
    }
    
    func player2Win(){
        
        let l1 = SKLabelNode()
        
        l1.text = "PERDEU"
        l1.position.y = 100
        l1.position.x = -30
        l1.fontSize = 12
        l1.zPosition = 20
        
        l1.fontName = "AVENGEANCE"
        l1.fontSize = 86
        scene!.addChild(l1)
        let move = SKAction.move(to: CGPoint(x: self.frame.midX,y: (self.frame.midY + 220) ), duration: 0.1)
        
        l1.run(move)
        
        
    }
    
    func draw() {
        
        let l1 = SKLabelNode()
        
        l1.text = "EMPATE"
        l1.position.y = 100
        l1.position.x = -30
        l1.fontSize = 12
        l1.zPosition = 20
        
        l1.fontName = "AVENGEANCE"
        l1.fontSize = 86
        scene!.addChild(l1)
        let move = SKAction.move(to: CGPoint(x: self.frame.midX, y: (self.frame.midY + 220)), duration: 0.1)
        
        l1.run(move)
    }
    
    func nextRound(carta1: Int, carta2: Int) {
        jogada -= 1
        user -= carta1
        cpu -= carta2
    }
    
    //Verifica qual jogador ganhou o Jogo
    func checkWin() {
        if player1Score == player2Score && user == 0 {
            draw()
        } else if player1Score > player2Score && user == 0 {
            player1Win()
        } else if player1Score < player2Score && user == 0 {
            player2Win()
        }
    }
    
    func animateGame(nomeItem: MakeCardType, card: SKNode) {
        let sizeIn = SKAction.scale(to: 2.0, duration: 0.5)
        let sizeOut = SKAction.scale(to: 1.0, duration: 0.5)
        let focus = SKAction.colorize(with: .green, colorBlendFactor: 1, duration: 0.3)
        let delay = SKAction.wait(forDuration: 2.0)
        
        player2Cards[cpu-1].childNode(withName: nomeItem.rawValue)?.run(focus)
        
        let cartaP2: Card! = CardDAO.findByName(name: player2Cards[cpu-1].name!)
        let cartaP1: Card! = CardDAO.findByName(name: player1Cards[user-1].name!)
        
        //Movimenta cartas dos players perdedores
        let moveP1 = SKAction.moveTo(x: -2000, duration: 2.0)
        let moveP2 = SKAction.moveTo(x: 2000, duration: 2.0)
        
        switch nomeItem {
        case .iteligencia:
            if cartaP1.intelligence == cartaP2.intelligence {
                //EMPATE
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            } else if cartaP1.intelligence < cartaP2.intelligence {
                //Vitoria-CPU
                player2Score += 1
                player2ScoreLabel.text = String(player2Score)
                player2ScoreLabel.color = .red
                player2ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player2ScoreLabel.color = SKColor .black
                
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            } else {
                //Vitoria-User
                player1Score += 1
                player1ScoreLabel.text = String(player1Score)
                player1ScoreLabel.color = SKColor .red
                player1ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player1ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
            }
        case .forca:
            if cartaP1.power == cartaP2.power {
                
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
            } else if cartaP1.power < cartaP2.power {
                
                player2Score += 1
                player2ScoreLabel.text = String(player2Score)
                player2ScoreLabel.color = SKColor .red
                player2ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player2ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay, moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
                
            } else {
                
                player1Score += 1
                player1ScoreLabel.text = String(player1Score)
                
                player1ScoreLabel.color = SKColor .red
                player1ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player1ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            }
            
        case .velocidade:
            if cartaP1.speed == cartaP2.speed {
                
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            } else if cartaP1.speed < cartaP2.speed {
                
                player2Score += 1
                player2ScoreLabel.text = String(player2Score)
                player2ScoreLabel.color = SKColor .red
                player2ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player2ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay, moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay, moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
            } else {
                
                player1Score += 1
                player1ScoreLabel.text = String(player1Score)
                player1ScoreLabel.color = SKColor .red
                player1ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player1ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay, moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay, moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
            }
            
        case .resistencia:
            if cartaP1.durability == cartaP2.durability {
                
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay, moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay, moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
            } else if cartaP1.durability < cartaP2.durability {
                
                player2Score += 1
                player2ScoreLabel.text = String(player2Score)
                player2ScoreLabel.color = SKColor .red
                player2ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player2ScoreLabel.color = SKColor .black
                
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay, moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            } else{
                
                player1Score += 1
                player1ScoreLabel.text = String(player1Score)
                player1ScoreLabel.color = SKColor .red
                player1ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player1ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay, moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
            }
            
        case .poder:
            if cartaP1.power == cartaP2.power {
                
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
            } else if cartaP1.power < cartaP2.power {
                
                player2Score += 1
                player2ScoreLabel.text = String(player2Score)
                player2ScoreLabel.color = SKColor .red
                player2ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player2ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                })
                
            } else {
                
                player1Score += 1
                player1ScoreLabel.text = String(player1Score)
                player1ScoreLabel.color = SKColor .red
                player1ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player1ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            }
            
        case .combate:
            if cartaP1.combat == cartaP2.combat {
                
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            } else if cartaP1.combat < cartaP2.combat {
                player2Score += 1
                player2ScoreLabel.text = String(player2Score)
                player2ScoreLabel.color = SKColor .red
                player2ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player2ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
                
            } else {
                
                player1Score += 1
                player1ScoreLabel.text = String(player1Score)
                player1ScoreLabel.color = SKColor .red
                player1ScoreLabel.run(SKAction.sequence([sizeIn, sizeOut]))
                player1ScoreLabel.color = SKColor .black
                nextRound(carta1: 1, carta2: 1)
                let sequence = SKAction.sequence([delay,moveP1])
                player1Cards[user].run(sequence)
                self.player2Cards[self.cpu].flip(face: false, completion: {
                    print("completou!")
                    let sequence = SKAction.sequence([delay,moveP2])
                    self.player2Cards[self.cpu].run(sequence)
                    
                })
            }
        }
        checkWin()
    }
    
    func criarCarta(nome: String, posx: CGFloat, posz: Int, ajuste: Int) -> MakeCard {
        
        guard let carta = CardDAO.findByName(name: nome) else {
            return MakeCard(cardNamed: "", faceUp: true, prize: true, userInteraction: true)
        }
        
        let hulk = MakeCard(cardNamed: carta.name, faceUp: true, prize: false, userInteraction: true)
        hulk.name = nome
        // hulk.position = CGPointMake(posx, 200)
        hulk.size.height = 500
        hulk.size.width = 320
        //addChild(hulk)
        hulk.zPosition = CGFloat(posz)
        
        let intelLabel = NSLocalizedString("Intelligence", comment:"Bronze")
        let forcaLabel = NSLocalizedString("Strength", comment:"Prata")
        let velocidadeLabel = NSLocalizedString("Speed", comment:"Ouro")
        let resisLabel = NSLocalizedString("Resistance", comment:"Lendario")
        let poderLabel = NSLocalizedString("Power", comment:"Bronze")
        let combateLabel = NSLocalizedString("Fighting", comment:"Prata")
        
        hulk.addChild(hulk.newPower(height: -10, name: "itemInteligencia",itemImage: hulk.category!, posz: posz))
        hulk.addChild(hulk.namePower(height: -15, nome: intelLabel, posz: posz))
        hulk.addChild(hulk.valuePower(height: -15, text: "\(carta.intelligence)", posz: posz, ajuste: ajuste))
        
        hulk.addChild(hulk.newPower(height: -50, name: "itemForca",itemImage: hulk.category!, posz: posz))
        hulk.addChild(hulk.namePower(height: -55, nome: forcaLabel, posz: posz))
        hulk.addChild(hulk.valuePower(height: -55, text: "\(carta.strength)", posz: posz,ajuste: ajuste))
        
        
        hulk.addChild(hulk.newPower(height: -90, name: "itemVelocidade",itemImage: hulk.category!, posz: posz))
        hulk.addChild(hulk.namePower(height: -95, nome: velocidadeLabel, posz: posz))
        hulk.addChild(hulk.valuePower(height: -95, text: "\(carta.speed)", posz: posz, ajuste: ajuste))
        
        hulk.addChild(hulk.newPower(height: -130, name: "itemResistencia", itemImage: hulk.category!, posz: posz))
        hulk.addChild(hulk.namePower(height: -135, nome: resisLabel, posz: posz))
        hulk.addChild(hulk.valuePower(height: -135, text: "\(carta.durability)", posz: posz, ajuste: ajuste))
        
        hulk.addChild(hulk.newPower(height: -170, name: "itemPoder",itemImage: hulk.category!, posz: posz))
        hulk.addChild(hulk.namePower(height: -175, nome: poderLabel, posz: posz))
        hulk.addChild(hulk.valuePower(height: -175, text: "\(carta.power)", posz: posz, ajuste: ajuste))
        
        hulk.addChild(hulk.newPower(height: -210, name: "itemCombate",itemImage: hulk.category!, posz: posz))
        hulk.addChild(hulk.namePower(height: -215, nome: combateLabel, posz: posz))
        hulk.addChild(hulk.valuePower(height: -215, text: "\(carta.combat)", posz: posz ,ajuste: ajuste))
        
        return hulk
        
    }
    
    
    func dealCards() {
        let mydeck = ["Quill","Hulk", "Daredevil", "Deadpool", "3D-Man", "Cyclops", "Thor", "Wolverine"]
        
        user = mydeck.count
        
        let deckCpu = ["Daredevil","Spider-man","Lizard","Quicksilver","Wolverine","Thor","War Machine","Doctor Strange"]
        
        cpu = deckCpu.count
        for count in 0...mydeck.count - 1 {
            let card: MakeCard = criarCarta(nome: mydeck[count], posx: 200, posz: count, ajuste: 0)
            //Adiciona a carta ao deck
            deck.append(card)
            
            let card2: MakeCard = criarCarta(nome: deckCpu[count], posx: 200, posz: count, ajuste: 20)
            //Adiciona a carta ao deck
            deckCPU.append(card2)
        }

        //Dealing cards
                
        let deal = SKAction.run {() -> Void in
            
            while self.deck.count > 0 {
                
                let index: Int = self.deck.count - self.deck.count // numero entre o total de cartas no deck
                
                self.player1Cards.append(self.deck[index])
                let removedCard = self.deck.remove(at: index)
                
                removedCard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                
                self.addChild(removedCard)
                //removedCard.flip()
                
                let newX: CGFloat = removedCard.size.width/2 + self.sides
                let cardsHeight = self.cardOffSet * 12 + removedCard.size.height
                let bottomEdge = (self.size.height - cardsHeight)/2
                let topEdge = self.size.height - bottomEdge
                
                let newY: CGFloat = topEdge - removedCard.size.height/2 - CGFloat(self.player1Cards.count - 1) * self.cardOffSet
                self.player1CardsPositions.append(CGPoint(x: newX, y: newY))
                
                let move = SKAction.move(to: CGPoint(x: newX,y: self.frame.midY ), duration: 1.0)
                
                removedCard.run(move)
                
            }
            
            while self.deckCPU.count > 0{
                
                let index: Int = self.deckCPU.count - self.deckCPU.count// numero entre o total de cartas no deck
                
                self.player2Cards.append(self.deckCPU[index])
                let removedCard = self.deckCPU.remove(at: index)
                
                removedCard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
                
                self.addChild(removedCard)
                removedCard.flipCard(faceUp: true)
                
                let newX:CGFloat = self.size.width - removedCard.size.width/2 - self.sides
                let cardsHeight = self.cardOffSet * 12 + removedCard.size.height
                let bottomEdge = (self.size.height - cardsHeight)/2
                let topEdge = self.size.height - bottomEdge
                
                let newY: CGFloat = topEdge - removedCard.size.height/2 - CGFloat(self.player2Cards.count - 1) * self.cardOffSet
                self.player2CardsPositions.append(CGPoint(x: newX, y: newY))
                
                let move = SKAction.move(to: CGPoint(x: newX, y: self.frame.midY), duration: 1.0)
                
                removedCard.run(move)
            }
        }
        
        let delay = SKAction.wait(forDuration: 2.0)
        ///IMPORTANTE PARA SEPARAR AS CARTAS EM BRONZE PRATA OURO E LENDARIA
        
        let sequence = SKAction.sequence([delay, deal, delay])
        //Executa a acao
        
        self.run(sequence, completion: { () -> Void in
            self.gameInProgress = true
            let turn: Int = Int(arc4random_uniform(4)+1)
            
            self.currentPlayer = turn
        })
    }
}
