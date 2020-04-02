import UIKit

enum Category: String {
    case bronze
    case prata
    case ouro
    case lendario
}

struct Card {

    let name: String
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
    let quantity: Int
    let category: Category
}
