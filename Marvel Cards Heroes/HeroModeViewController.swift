//
//  HeroModeViewController.swift
//  Marvel Cards Heroes
//
//  Created by Leonardo Bonetti Maffei on 17/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import UIKit

class HeroModeViewController: UIViewController {

    @IBOutlet weak var easeButtonOutlet: UIButton!
    @IBOutlet weak var mediumButtonOutlet: UIButton!
    @IBOutlet weak var hardButtonOutlet: UIButton!
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var homeButtonOutlet: UIButton!
    
    @IBOutlet weak var spaceToBar1: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        let easyLabel = NSLocalizedString("Easy", comment: "Modo Facil")
        let mediumLabel = NSLocalizedString("Medium", comment: "Modo Medio")
        let hardLabel = NSLocalizedString("Hard", comment: "Modo Dificil")
        let startLabel = NSLocalizedString("Start", comment: "Modo Play Game")
        
        easeButtonOutlet.setTitle(easyLabel, for: .normal)
        mediumButtonOutlet.setTitle(mediumLabel, for: .normal)
        hardButtonOutlet.setTitle(hardLabel, for: .normal)
        startButtonOutlet.setTitle(startLabel, for: .normal)
        spaceToBar1.constant = 1000
    }

    @IBAction func easeButtonAction(sender: AnyObject) {
        easeButtonOutlet.isEnabled = false
        mediumButtonOutlet.isEnabled = true
        hardButtonOutlet.isEnabled = true
        movebutton()
    }

    @IBAction func mediundButtonAction(sender: AnyObject) {
        easeButtonOutlet.isEnabled = true
        mediumButtonOutlet.isEnabled = false
        hardButtonOutlet.isEnabled = true
        movebutton()
    }
    @IBAction func hardbuttonAction(sender: AnyObject) {
        easeButtonOutlet.isEnabled = true
        mediumButtonOutlet.isEnabled = true
        hardButtonOutlet.isEnabled = false
        movebutton()
    }

    @IBAction func dismiss(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    func movebutton() {

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {

            self.spaceToBar1.constant = 0
            self.view.layoutIfNeeded()
            }, completion: { _ in })

    }
}
