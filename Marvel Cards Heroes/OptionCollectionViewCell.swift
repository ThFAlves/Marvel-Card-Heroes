import UIKit

class OptionCollectionViewCell: UICollectionViewCell {

    // MARK: - Public API
    var option: Options! {
        didSet {
            updateUI()
        }
    }

    // MARK: - Private
    @IBOutlet var featuredImageView: UIImageView!
    @IBOutlet var featuredImageMode: UIImageView!
    @IBOutlet var optionTitleLabel: UILabel!

    private func updateUI() {
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
