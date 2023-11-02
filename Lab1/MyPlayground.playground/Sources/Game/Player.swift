import Foundation

public protocol Player {
    var name: String { get }
    var side: Side { get }
    var startPos: [Cell] { get set }
    var endPos: [Cell] { get set }
    var curPos: [Cell] { get set }
    var achievedCells: Int { get set }
    func removeCurPos(cell:Cell)
}

public enum Side: Int {
    case black = -1
    case white = 1
}

public enum PlayerAction {
    case win
    case move(xStart: Int, yStart: Int, xEnd: Int, yEnd: Int)
    case special(square: Int, explanation: String)
}


