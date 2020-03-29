//
//  MeuDeck.swift
//  Marvel Cards Heroes
//
//  Created by Thiago Felipe Alves on 22/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import UIKit

class MeuDeck: UIViewController {
    
    let cartas = ["Ant-man.png","Captain America.png","Ciclope.png","Doctor Strange.png","Fenix.png","Homem de Ferro.png","Human-Touch.png","Lizard.png","Loki.png","Nick Fury.png","Quicksilver.png","Red Hulk.png","Spider-man.png","War Machine.png","Winter Soldier.png","3D-Man.png","Hulk.png","Deadpool.png","Noturno.png","Thor.png","Quill.png","Visão.png","Wolverine.png","Demolidor.png"]
    
    let heroes = ["Ant-man","Captain America","Cyclops","Doctor Strange","Phoenix","Iron Man","Human-Touch","Lizard","Loki","Nick Fury","Quicksilver","Red Hulk","Spider-man","War Machine","Winter Soldier","3D-Man" ,"Hulk","Deadpool","Nightcrawler","Thor","Quill","Vision","Wolverine","Daredevil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private struct Storyboard{
        static let CellIdentifier = "CellCards"
    }
    
    @IBAction func dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension MeuDeck: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath as IndexPath) as! CardsCollectionViewCell
        
        
        let image: UIImage = UIImage(named: cartas[indexPath.row])!
        cell.Card.image = image
        
        
        let carta:Card! = CardDAO.findByName(name: heroes[indexPath.row])[0]
        if (carta != nil) {
            cell.Intelligence.text = "\(carta.intelligence)"
            cell.Strength.text = "\(carta.strength)"
            cell.Speed.text = "\(carta.speed)"
            cell.Durability.text = "\(carta.durability)"
            cell.Power.text = "\(carta.power)"
            cell.Combat.text = "\(carta.combat)"
            cell.nameHero.text = "\(carta.name)"
            
            cell.intelligenceImage.image = UIImage(named: carta.category+".png")
            cell.StrengthImage.image = UIImage(named: carta.category+".png")
            cell.SpeedImage.image = UIImage(named: carta.category+".png")
            cell.DurabilityImage.image = UIImage(named: carta.category+".png")
            cell.PowerImage.image = UIImage(named: carta.category+".png")
            cell.CombatImage.image = UIImage(named: carta.category+".png")
        }
        
        cell.clipsToBounds = true
        
        return cell
    }

    
}
