import Foundation
import UIKit

class Options {

    //Mark - Public API
    var title = ""
    var description = ""
    var numberOfMembers = 0
    var numberOfPosts = 0
    var featuredImage: UIImage!
    var featuredImageMode: UIImage!

    init(title: String,
         description: String,
         featuredImage: UIImage,
         featuredImageMode: UIImage) {

        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        self.featuredImageMode = featuredImageMode
        numberOfMembers = 1
        numberOfPosts = 1
    }

    // MARK: - Private
    static func createInterests() -> [Options] {
        let heroLabel = NSLocalizedString("Hero Mode", comment: "Player x CPU")
        let versusLabel = NSLocalizedString("Versus Mode", comment: "Player x Player")
        
        return [
            Options(title: heroLabel,
                    description: "Hero Mode",
                    featuredImage: UIImage(named: "Espaco")!,
                    featuredImageMode: UIImage(named: "reactor")!),
            Options(title: versusLabel,
                    description: "Versus Mode",
                    featuredImage: UIImage(named: "Espaco")!,
                    featuredImageMode: UIImage(named: "Novo Versus")!)
        ]
    }
}
