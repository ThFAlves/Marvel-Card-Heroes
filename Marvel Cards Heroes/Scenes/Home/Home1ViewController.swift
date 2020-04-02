import UIKit
import SwiftUI

class Home1ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(MenuOptionCell.self)

//        self.deckButton.setTitle("Deck", for: .normal)
//        //self.deckButton.titleLabel?.font = UIFont(name: "IRON MAN OF WAR 001C NCV", size: 45)
//
//        let storeLabel = NSLocalizedString("Store", comment:"Store Button")
//
//        self.storeButton.setTitle(storeLabel, for: .normal)
//        //self.storeButton.titleLabel?.font = UIFont(name: "IRON MAN OF WAR 001C NCV", size: 45)
//
//        self.money.text = "\(UserDAO.returnMoney())"

        UserServices.createUser(name: "Teste", wins: 5, loss: 4, level: 3, money: 1000)
    }
}

extension Home1ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return collectionView.dequeueReusableCell(of: MenuOptionCell.self, for: indexPath)
    }
}

extension Home1ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = collectionView.frame.height
        return CGSize(width: height, height: height)
    }
}

struct Menu1ViewControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = Home1ViewController

    func makeUIViewController(context: Context) -> Home1ViewController {
        return Home1ViewController()
    }

    func updateUIViewController(_ uiViewController: Home1ViewController, context: Context) {
    }
}
