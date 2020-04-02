import UIKit

public extension UICollectionViewCell {
    static var identifier: String { return String(describing: self) }
}

public extension UICollectionView {
    func register(_ cell: UICollectionViewCell.Type) {
        let nib = UINib(nibName: cell.identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: cell.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(of class: T.Type,
                                                      for indexPath: IndexPath,
                                                      configure: @escaping ((T) -> Void) = { _ in }) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath)
        if let typedCell = cell as? T {
            configure(typedCell)
        }
        return cell
    }
}
