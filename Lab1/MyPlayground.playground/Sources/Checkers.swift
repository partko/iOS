import Foundation

public protocol CheckersDelegate: TwoPlayerTurnbasedGameDelegate {}

public class Checkers: BoardGame, TwoPlayerGame, TurnbasedGame {
    public let name = "Checkers"
    
    public var delegate: CheckersDelegate?
    
    public init() {
        
    }
    
    // MARK: - BoardGame
    
    public var board = Board(boardsize: 8)
    
    // MARK: - TwoPlayerGame

    public var players: [Player] = [CheckersPlayer]()
    
    public func join(player: Player) {
        players.append(player)
        delegate?.player(player, didJoinTheGame: self)
    }
    
    // MARK: - TurnbasedGame

    private var numberOfTurns = 0

    public var turns: Int {
        get { return numberOfTurns }
    }
    
    public var hasEnded: Bool {
        get {
            if players.count == 0 {
                return true
            } else {
                for p in players {
                    if p.curPos.count == 0 {
                        return true
                    }
                }
            }
            return false
        }
    }
    
    public func start() {
        players[0].startPos = [
            Cell(x: cells["A8"]![0], y: cells["A8"]![1]), Cell(x: cells["A7"]![0], y: cells["A7"]![1]), Cell(x: cells["A6"]![0], y: cells["A6"]![1]),
            Cell(x: cells["B8"]![0], y: cells["B8"]![1]), Cell(x: cells["B7"]![0], y: cells["B7"]![1]), Cell(x: cells["B6"]![0], y: cells["B6"]![1]),
            Cell(x: cells["C8"]![0], y: cells["C8"]![1]), Cell(x: cells["C7"]![0], y: cells["C7"]![1]), Cell(x: cells["C6"]![0], y: cells["C6"]![1])
        ]
//        players[0].startPos = [
//            cells["A8"]!, cells["A7"]!, cells["A6"]!,
//            cells["B8"]!, cells["B7"]!, cells["B6"]!,
//            cells["C8"]!, cells["C7"]!, cells["C6"]!
//        ]
        
        players[0].endPos = [
            Cell(x: cells["H1"]![0], y: cells["H1"]![1]), Cell(x: cells["H2"]![0], y: cells["H2"]![1]), Cell(x: cells["H3"]![0], y: cells["H3"]![1]),
            Cell(x: cells["G1"]![0], y: cells["G1"]![1]), Cell(x: cells["G2"]![0], y: cells["G2"]![1]), Cell(x: cells["G3"]![0], y: cells["G3"]![1]),
            Cell(x: cells["F1"]![0], y: cells["F1"]![1]), Cell(x: cells["F2"]![0], y: cells["F2"]![1]), Cell(x: cells["F3"]![0], y: cells["F3"]![1])
        ]
        
//        players[0].endPos = [
//            cells["H1"]!, cells["H2"]!, cells["H3"]!,
//            cells["G1"]!, cells["G2"]!, cells["G3"]!,
//            cells["F1"]!, cells["F2"]!, cells["F3"]!
//        ]
        players[0].curPos = players[0].startPos
        
        players[1].startPos = [
            Cell(x: cells["H1"]![0], y: cells["H1"]![1]), Cell(x: cells["H2"]![0], y: cells["H2"]![1]), Cell(x: cells["H3"]![0], y: cells["H3"]![1]),
            Cell(x: cells["G1"]![0], y: cells["G1"]![1]), Cell(x: cells["G2"]![0], y: cells["G2"]![1]), Cell(x: cells["G3"]![0], y: cells["G3"]![1]),
            Cell(x: cells["F1"]![0], y: cells["F1"]![1]), Cell(x: cells["F2"]![0], y: cells["F2"]![1]), Cell(x: cells["F3"]![0], y: cells["F3"]![1])
        ]
        //players[1].startPos = players[0].endPos
        
        players[1].endPos = [
            Cell(x: cells["A8"]![0], y: cells["A8"]![1]), Cell(x: cells["A7"]![0], y: cells["A7"]![1]), Cell(x: cells["A6"]![0], y: cells["A6"]![1]),
            Cell(x: cells["B8"]![0], y: cells["B8"]![1]), Cell(x: cells["B7"]![0], y: cells["B7"]![1]), Cell(x: cells["B6"]![0], y: cells["B6"]![1]),
            Cell(x: cells["C8"]![0], y: cells["C8"]![1]), Cell(x: cells["C7"]![0], y: cells["C7"]![1]), Cell(x: cells["C6"]![0], y: cells["C6"]![1])
        ]
        //players[1].endPos = players[0].startPos
        players[1].curPos = players[1].startPos
    }
    
    public func makeTurn() {
        numberOfTurns += 1
        delegate?.gameDidStartTurn(self)
        for var p in players {
            if numberOfTurns > 1000 {
                for var p in players {
                    p.curPos = []
                }
                break
            }
            //board.showBoard()
            playerMakeTurn(&p)
            if self.hasEnded {
                break
            }
        }
        delegate?.gameDidEndTurn(self)
    }
    
    public func end() {
        delegate?.player(players.filter({ p in p.curPos.count == 0 }).first!, didTakeAction: .win)
        delegate?.gameDidEnd(self)
    }
        
    // MARK: - Player logic

    public func playerMakeTurn( _ player: inout Player) {
        delegate?.playerDidStartTurn(player)
        turn(player: player.side.rawValue, moves: numberOfTurns, Player: player)
        board.showBoard()
    }
    
    public func turn(player: Int, moves: Int, Player: Player) {
        //print("numberOfTurns: \(numberOfTurns)")
        //print("Player curPos.count: \(Player.curPos.count)")
        if moves < 50 {
            var turnSeed:Int = 0
            while true {
                turnSeed = Int.random(in: 0..<Player.curPos.count)
                if checkMove(player: player, cell: Player.curPos[turnSeed]) {
                    break
                }
            }
            while makeTurn(player: player, cell: Player.curPos[turnSeed]) { break }
            checkCell(player: player, cell: Player.curPos[turnSeed], Player: Player)
            
        } else {
            var turnSeed:Int = 0
            var tryCount = 0
            while true {
                turnSeed = Int.random(in: 0..<Player.curPos.count)
                if checkMove(player: player, cell: Player.curPos[turnSeed]) {
                    while makeTurn(player: player, cell: Player.curPos[turnSeed]) {
                        break
                    }
                    checkCell(player: player, cell: Player.curPos[turnSeed], Player: Player)
                    break
                }
                tryCount+=1
                if tryCount > 5 {
                    makeTurn(player: player*(-2), cell: Player.curPos[turnSeed])
                    checkCell(player: player, cell: Player.curPos[turnSeed], Player: Player)
                    break
                }
            }
        }
    }
    
    public func checkMove(player: Int, cell: Cell) -> Bool {
        if ((0...7).contains(cell.x+player*2) && board.getField(x: cell.x+player, y: cell.y) != 0 && board.getField(x: cell.x+player*2, y: cell.y) == 0) {
            return true
        } else if ((0...7).contains(cell.y+player*2) && board.getField(x: cell.x, y: cell.y+player) != 0 && board.getField(x: cell.x, y: cell.y+player*2) == 0) {
            return true
        } else if ((0...7).contains(cell.x+player) &&  board.getField(x: cell.x+player, y: cell.y) == 0) {
            return true
        } else if ((0...7).contains(cell.y+player) && board.getField(x: cell.x, y: cell.y+player) == 0) {
            return true
        }
        return false
    }
    
    public func makeTurn(player: Int, cell: Cell) -> Bool {
        var isMove = false
        let r = Int.random(in: 0...10)
        if r < 5 {
            while true {
                if ((0...7).contains(cell.x+player*2) && board.getField(x: cell.x+player, y: cell.y) != 0 && board.getField(x: cell.x+player*2, y: cell.y) == 0) {
                    cell.setX(x: cell.x + player*2)
                    updateBoard()
                    isMove = true
                    continue
                } else if ((0...7).contains(cell.y+player*2) && board.getField(x: cell.x, y: cell.y+player) != 0 && board.getField(x: cell.x, y: cell.y+player*2) == 0) {
                    cell.setY(y: cell.y + player*2)
                    updateBoard()
                    isMove = true
                    continue
                } else if ((0...7).contains(cell.x+player) &&  board.getField(x: cell.x+player, y: cell.y) == 0) {
                    if !isMove {
                        cell.setX(x: cell.x + player)
                        updateBoard()
                    }
                    break
                } else if ((0...7).contains(cell.y+player) && board.getField(x: cell.x, y: cell.y+player) == 0) {
                    if !isMove {
                        cell.setY(y: cell.y + player)
                        updateBoard()
                    }
                    break
                } else { return false }
            }
        } else {
            while true {
                if ((0...7).contains(cell.y+player*2) && board.getField(x: cell.x, y: cell.y+player) != 0 && board.getField(x: cell.x, y: cell.y+player*2) == 0) {
                    cell.setY(y: cell.y + player*2)
                    updateBoard()
                    isMove = true
                    continue
                } else if ((0...7).contains(cell.x+player*2) && board.getField(x: cell.x+player, y: cell.y) != 0 && board.getField(x: cell.x+player*2, y: cell.y) == 0) {
                    cell.setX(x: cell.x + player*2)
                    updateBoard()
                    isMove = true
                    continue
                } else if ((0...7).contains(cell.y+player) && board.getField(x: cell.x, y: cell.y+player) == 0) {
                    if !isMove {
                        cell.setY(y: cell.y + player)
                        updateBoard()
                    }
                    break
                } else if ((0...7).contains(cell.x+player) &&  board.getField(x: cell.x+player, y: cell.y) == 0) {
                    if !isMove {
                        cell.setX(x: cell.x + player)
                        updateBoard()
                    }
                    break
                } else { return false }
            }
        }
        return true
    }
    
    public func checkCell(player: Int, cell: Cell, Player: Player) {
        //print("checkCell")
        var isMove = false
        var isFinish = false
        isMove = checkMove(player: player, cell: cell)
        //print(Player.endPos)
        //print("cell.x \(cell.x), cell.y \(cell.y)")
        for el in Player.endPos {
            //print("el.x \(el.x), el.y \(el.y)")
            if (cell.x == el.x && cell.y == el.y) {
                //print("isFinish")
                isFinish = true
            }
        }
        if (!isMove && isFinish) {
            Player.removeCurPos(cell: cell)
            board.setFullField(full: Player.side.rawValue, x: cell.x, y: cell.y)
        }
    }
    
    public func updateBoard() {
        board.cleanBoard()
        for p in players {
            p.curPos.forEach { cell in
                board.setField(data: p.side.rawValue, x: cell.x, y: cell.y)
            }
        }
        for i in 0...7 {
            for j in 0...7 {
                if board.getFullField(x: i, y: j) != 0 {
                    board.setField(data: board.getFullField(x: i, y: j), x: i, y: j)
                }
            }
        }
    }
    
    
}
