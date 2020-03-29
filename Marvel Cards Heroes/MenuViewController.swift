//
//  MenuViewController.swift
//  Marvel Cards Heroes
//
//  Created by Luiz Henrique Silveira Cruz Junior on 11/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var money: UILabel!
    @IBOutlet var storeButton: UIButton!
    @IBOutlet var deckButton: UIButton!
    
    var detailSegues = ["seguePlay","segueVS","segueDeck","segueShop"]
    
    // MARK - UICollectionViewDataSource
    
    private var options = Options.createInterests()
    let animationDuration: TimeInterval = 1
    let switchingInterval: TimeInterval = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Verificar se é a primeira inicializacao
        let ret = CardDAO.findAll()
        if (ret.count == 0){
            //Inserir os elementos no CoreData
            CarregaCoreData.inicializa()
            UserServices.createUser(name: "Teste", wins: 5, loss: 4, level: 3, money: 1000)
        }

        self.deckButton.setTitle("Deck", for: .normal)
        //self.deckButton.titleLabel?.font = UIFont(name: "IRON MAN OF WAR 001C NCV", size: 45)
        
        let storeLabel = NSLocalizedString("Store", comment:"Store Button")
        
        self.storeButton.setTitle(storeLabel, for: .normal)
        //self.storeButton.titleLabel?.font = UIFont(name: "IRON MAN OF WAR 001C NCV", size: 45)
        
        self.money.text = "\(UserDAO.returnMoney())"

    }
    
//    func animateImageView() {
//        CATransaction.begin()
//        
//        CATransaction.setAnimationDuration(animationDuration)
//        CATransaction.setCompletionBlock {
//            dispatch
//            let delay = dispatch_time(dispatch_time_t(DispatchTime.now()), Int64(self.switchingInterval * TimeInterval(NSEC_PER_SEC)))
//            dispatch_after(delay, dispatch_get_main_queue()) {
//                self.animateImageView()
//            }
//        }
//        
//        let transition = CATransition()
//        transition.type = CATransitionType.fade
//        
//        CATransaction.commit()
//    }

    private struct Storyboard{
        static let CellIdentifier = "Option Cell"
    }
    
    
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath as IndexPath) as! OptionCollectionViewCell
        
        cell.option = self.options[indexPath.item]
        cell.optionTitleLabel.textColor = .white
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: detailSegues[indexPath.row], sender: indexPath)
    }
}
