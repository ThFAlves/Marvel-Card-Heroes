//
//  ShopViewController.swift
//  Marvel Cards Heroes
//
//  Created by Luiz Henrique Silveira Cruz Junior on 11/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import UIKit
import SpriteKit

// swiftlint:disable all
class ShopViewController: UIViewController, UICollectionViewDelegate, SKSceneDelegate {
   
    var xPosition: CGFloat = 0.0
    var xSecondPosition: CGFloat = 0.0
    var type:Int = 0

    @IBOutlet var buyImage: UIImageView!
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var infoTwo: UILabel!
    @IBOutlet var infoOne: UILabel!
    @IBOutlet var boosterName: UILabel!
    
    @IBOutlet var buyView: UIView!
 
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet weak var returnButtonOutlet: UIButton!
    
    @IBOutlet weak var leadingView: NSLayoutConstraint!
    @IBOutlet weak var trallingCollection: NSLayoutConstraint!
    
    func viewGoLeft(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.trallingCollection.constant = 1100
            self.leadingView.constant = 0
            self.view.layoutIfNeeded()
                
                }, completion: { finished in
                    
            })
        
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
            self.buyView.isHidden = false
            self.returnButtonOutlet.isHidden = false
            }, completion: { finished in
                
        })

        
    }
    
    @IBAction func cancel(sender: AnyObject) {

        
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            
            self.leadingView.constant = 1100
            self.view.layoutIfNeeded()
            }, completion: { finished in
                
                self.buyView.isHidden = true
        })
        
        let skView = self.view as! SKView
        
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        
        //size: self.view.bounds.size
        let scene = ShopScene(size: self.view.bounds.size, type: 1)
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        
    }
    @IBAction func returnButtonAction(sender: AnyObject) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            
            
            self.trallingCollection.constant = 0
            self.leadingView.constant = 1100
            self.view.layoutIfNeeded()
            
            }, completion: { finished in
                self.returnButtonOutlet.isHidden = true
                
        })
        
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
            self.buyView.isHidden = false
            
            }, completion: { finished in
                
        })
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.leadingView.constant = 600
        self.trallingCollection.constant = 0
        
        
        self.returnButtonOutlet.isHidden = true
        
        self.buyView.isHidden = true
        
        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
            
            let _: CGRect = self.buyView.frame
            
            }, completion: { finished in
                self.buyView.frame.origin.x = self.view.frame.size.width ;
        })
        
        
    }
       
    var tableImages:[String] = ["Booster1","Booster4","Booster2","Booster3"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableImages.count
    }
    
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let buyButtonLabel = NSLocalizedString("Buy Pack", comment:"Botao Comprar")
        
        self.buyButton.setTitle(buyButtonLabel, for: .normal)
                
        collectionView.selectItem(at: indexPath as IndexPath,
                                  animated: true,
                                  scrollPosition: .centeredHorizontally)
        //zoomToSelectedImage(indexPath: indexPath,cell: cell)
        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
            
            let bronzeLabel = NSLocalizedString("Bronze Pack", comment: "Bronze")
            let silverLabel = NSLocalizedString("Silver Pack", comment: "Prata")
            let goldLabel = NSLocalizedString("Golden Pack", comment: "Ouro")
            let legendaryLabel = NSLocalizedString("Legendary Pack", comment: "Lendario")
            let infoBronzeOneLabel = NSLocalizedString("3 Bronze Cards", comment: "Botao Home")
            _ = NSLocalizedString("1 Silver Card", comment: "Botao Home")
            let infoSilverOneLabel = NSLocalizedString("2 Bronze Cards", comment: "Botao Home")
            let infoSilverTwoLabel = NSLocalizedString("1 Silver Card", comment: "Botao Home")
            let infoGoldenOneLabel = NSLocalizedString("2 Silver Cards", comment: "Botao Home")
            let infoGoldenTwoLabel = NSLocalizedString("1 Golden Card", comment: "Botao Home")
            let infoLegendaryOneLabel = NSLocalizedString("1 Golden Card", comment: "Botao Home")
            let infoLegendaryTwoLabel = NSLocalizedString("1 Legendary Card", comment: "Botao Home")
            
            if indexPath.row == 0 {
                self.buyImage.image = UIImage(named: "Booster1")
                self.boosterName.text = bronzeLabel
                self.infoOne.text = infoBronzeOneLabel
                self.infoTwo.text = ""
            }else if indexPath.row == 1 {
                
                self.buyImage.image = UIImage(named: "Booster4")
                self.boosterName.text = silverLabel
                self.infoOne.text = infoSilverOneLabel
                self.infoTwo.text = infoSilverTwoLabel
            }else if indexPath.row == 2 {
                
                self.buyImage.image = UIImage(named: "Booster2")
                self.boosterName.text = goldLabel
                self.infoOne.text = infoGoldenOneLabel
                self.infoTwo.text = infoGoldenTwoLabel
                
            }else if indexPath.row == 3 {
                
                self.buyImage.image = UIImage(named: "Booster3")
                self.boosterName.text = legendaryLabel
                self.infoOne.text = infoLegendaryOneLabel
                self.infoTwo.text = infoLegendaryTwoLabel
            }

            }, completion: { _ in

        })
        
        self.viewGoLeft()
    }
    
    func zoomToSelectedImage(indexPath: NSIndexPath, cell: UICollectionViewCell)
    {
        let image = UIImage(named: self.tableImages[indexPath.row])
        
        var zoomImage : UIImageView
        
        zoomImage =  UIImageView(image: image)
        
        zoomImage.contentMode = UIView.ContentMode.scaleAspectFit
        
        let zoomFrameTo = CGRect(x: 1024 * -0.1, y: self.view.frame.height / 10, width: self.view.frame.size.width * 0.8,height: self.view.frame.size.height * 0.8);
        
        let zoomFrameFrom = cell.frame;
        
        self.view.addSubview(zoomImage)
        
        zoomImage.frame = zoomFrameFrom
        
        zoomImage.alpha = 0.2
    
   
        UIView.animate(withDuration: 1, animations: { () -> Void in
            zoomImage.frame = zoomFrameTo;
            zoomImage.alpha = 1;
        }, completion: nil)
    }
}

extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
           let cell:BoosterCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! BoosterCell
        
           
           cell.boosterImage.image = UIImage(named: tableImages[indexPath.row])
           
           return cell
    }
}
