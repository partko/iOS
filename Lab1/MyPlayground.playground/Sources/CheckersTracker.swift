import Foundation

public class CheckersPlayer: Player {
    public let name: String
    public var side: Side
    public var startPos: [Cell]
    public var endPos: [Cell]
    public var curPos: [Cell]
    public var achievedCells: Int
    
    public func removeCurPos(cell:Cell) {
        var new = [Cell]()
        for el in self.curPos {
            if el.x == cell.x && el.y == cell.y {
                continue
            }
            new.append(el)
        }
        self.curPos = new
    }
    
//    public func removeCurPos(cell:Cell) {
//        self.curPos = curPos.filter() {$0 != cell}
//    }
    
    public init(name: String, side: Side, achievedCells: Int) {
        self.name = name
        self.side = side
        self.achievedCells = achievedCells
        
        self.startPos = []
        self.endPos = []
        self.curPos = []
    }
}

public class CheckersTracker: CheckersDelegate {
    public init() {
        
    }
    
    public func gameDidStartTurn(_ game: TurnbasedGame) {
        print("==================\n")
        print("Move \((game as! TurnbasedGame).turns)")
    }

    public func playerDidStartTurn(_ player: Player) {
        print("\n\(player.name) start turn...")
    }
}
