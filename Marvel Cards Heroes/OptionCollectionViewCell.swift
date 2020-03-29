//
//  OptionCollectionViewCell.swift
//  Marvel Cards Heroes
//
//  Created by Luiz Henrique Silveira Cruz Junior on 11/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

//
//  InterestsCollectionViewCell.swift
//  Interests
//
//  Created by Luiz Henrique Silveira Cruz Junior on 03/07/15.
//  Copyright (c) 2015 Luiz Henrique Silveira Cruz Junior. All rights reserved.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    
    //MARK - Public API
    
    var option: Options!{
        
        didSet{
            updateUI()
        }
    }
    
    
    //MARK - Private
    

    
    @IBOutlet var featuredImageView: UIImageView!
    
    @IBOutlet var featuredImageMode: UIImageView!
    @IBOutlet var optionTitleLabel: UILabel!
    private func updateUI(){
        optionTitleLabel.text = option.title
        featuredImageView.image = option.featuredImage
        featuredImageMode.image = option.featuredImageMode
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    
}

