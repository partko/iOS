import Foundation

// Game

public protocol TwoPlayerGame: Game {
    var players: [Player] { get }
    func join(player: Player)
}

// Delegates

public protocol TwoPlayerGameDelegate: GameDelegate {
    func player(_ player: Player, didJoinTheGame game: TwoPlayerGame)
    func player(_ player: Player, didTakeAction action: PlayerAction)
}

public protocol TwoPlayerTurnbasedGameDelegate: TurnbasedGameDelegate, TwoPlayerGameDelegate {
    func playerDidStartTurn(_ player: Player)
    func playerDidEndTurn(_ player: Player)
}

// Default Implementation

extension TwoPlayerGameDelegate {
    public func player(_ player: Player, didJoinTheGame game: TwoPlayerGame) {
        print("\(player.name) has joined the game")
    }
    
    public func player(_ player: Player, didTakeAction action: PlayerAction) {
        switch action {
        case .win:
            print("\(player.name) wins!")
        case let .move(xStart, yStart, xEnd, yEnd):
            print("\(player.name) moves from \(xStart),\(yStart) to \(xEnd),\(yEnd)")
        case let .special(_, explanation):
            print("\(player.name) \(explanation)")
        }
    }
}

extension TwoPlayerTurnbasedGameDelegate {
    public func playerDidStartTurn(_ player: Player) {}
    public func playerDidEndTurn(_ player: Player) {}
}
