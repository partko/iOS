import Foundation

// Game

public protocol BoardGame: Game {
    var board: Board { get }
}

// Delegates

//public protocol BoardGameDelegate: GameDelegate {
//    func game(_ game: BoardGame, didDiceRoll diceRoll: Int)
//}
