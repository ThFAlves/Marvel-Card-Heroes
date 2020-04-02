import UIKit

// swiftlint:disable all
class HeroCardCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    

    @IBOutlet weak var intelligenceImage: UIImageView!
    @IBOutlet weak var StrengthImage: UIImageView!
    @IBOutlet weak var SpeedImage: UIImageView!
    @IBOutlet weak var DurabilityImage: UIImageView!
       
    @IBOutlet weak var PowerImage: UIImageView!
       
    @IBOutlet weak var CombatImage: UIImageView!
       
    @IBOutlet weak var Intelligence: UILabel!
       
    @IBOutlet weak var Strength: UILabel!
       
    @IBOutlet weak var Speed: UILabel!
       
       @IBOutlet weak var Durability: UILabel!
       
       @IBOutlet weak var Power: UILabel!
       
       @IBOutlet weak var Combat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
