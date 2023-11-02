import UIKit

let game = Checkers()

game.delegate = CheckersTracker()

game.join(player: CheckersPlayer(name: "Alice", side: Side.white, achievedCells: 0))

game.join(player: CheckersPlayer(name: "Alex", side: Side.black, achievedCells: 0))

game.play()

