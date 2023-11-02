import Foundation

//public struct Cell {
//    var x: Int
//    var y: Int
//    public mutating func setX(x: Int) {
//        self.x = x
//    }
//    public mutating func setY(y: Int) {
//        self.y = y
//    }
//}

//extension Cell {
//    static func != (lCell: Self, rCell: Self) -> Bool {
//        return lCell.x != rCell.x && lCell.y != rCell.y
//    }
//}

protocol CellStruct {
    var x:Int { get }
    var y:Int { get }
    func setX(x: Int)
    func setY(y: Int)
}

public class Cell: CellStruct {
    var x: Int = 0
    var y: Int = 0
    public func setX(x: Int) {
        self.x = x
    }
    public func setY(y: Int) {
        self.y = y
    }
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

extension Cell {
    static func != (lCell: Cell, rCell: Cell) -> Bool {
        return lCell.x != rCell.x && lCell.y != rCell.y
    }
}



let cells: [String:[Int]] = [
    "A1":[0, 7],
    "A2":[0, 6],
    "A3":[0, 5],
    "A4":[0, 4],
    "A5":[0, 3],
    "A6":[0, 2],
    "A7":[0, 1],
    "A8":[0, 0],

    "B1":[1, 7],
    "B2":[1, 6],
    "B3":[1, 5],
    "B4":[1, 4],
    "B5":[1, 3],
    "B6":[1, 2],
    "B7":[1, 1],
    "B8":[1, 0],

    "C1":[2, 7],
    "C2":[2, 6],
    "C3":[2, 5],
    "C4":[2, 4],
    "C5":[2, 3],
    "C6":[2, 2],
    "C7":[2, 1],
    "C8":[2, 0],

    "D1":[3, 7],
    "D2":[3, 6],
    "D3":[3, 5],
    "D4":[3, 4],
    "D5":[3, 3],
    "D6":[3, 2],
    "D7":[3, 1],
    "D8":[3, 0],

    "E1":[4, 7],
    "E2":[4, 6],
    "E3":[4, 5],
    "E4":[4, 4],
    "E5":[4, 3],
    "E6":[4, 2],
    "E7":[4, 1],
    "E8":[4, 0],

    "F1":[5, 7],
    "F2":[5, 6],
    "F3":[5, 5],
    "F4":[5, 4],
    "F5":[5, 3],
    "F6":[5, 2],
    "F7":[5, 1],
    "F8":[5, 0],

    "G1":[6, 7],
    "G2":[6, 6],
    "G3":[6, 5],
    "G4":[6, 4],
    "G5":[6, 3],
    "G6":[6, 2],
    "G7":[6, 1],
    "G8":[6, 0],

    "H1":[7, 7],
    "H2":[7, 6],
    "H3":[7, 5],
    "H4":[7, 4],
    "H5":[7, 3],
    "H6":[7, 2],
    "H7":[7, 1],
    "H8":[7, 0],
]
//
//let cells: [String:Cell] = [
//    "A1":Cell(x: 0,y: 7),
//    "A2":Cell(x: 0,y: 6),
//    "A3":Cell(x: 0,y: 5),
//    "A4":Cell(x: 0,y: 4),
//    "A5":Cell(x: 0,y: 3),
//    "A6":Cell(x: 0,y: 2),
//    "A7":Cell(x: 0,y: 1),
//    "A8":Cell(x: 0,y: 0),
//
//    "B1":Cell(x: 1,y: 7),
//    "B2":Cell(x: 1,y: 6),
//    "B3":Cell(x: 1,y: 5),
//    "B4":Cell(x: 1,y: 4),
//    "B5":Cell(x: 1,y: 3),
//    "B6":Cell(x: 1,y: 2),
//    "B7":Cell(x: 1,y: 1),
//    "B8":Cell(x: 1,y: 0),
//
//    "C1":Cell(x: 2,y: 7),
//    "C2":Cell(x: 2,y: 6),
//    "C3":Cell(x: 2,y: 5),
//    "C4":Cell(x: 2,y: 4),
//    "C5":Cell(x: 2,y: 3),
//    "C6":Cell(x: 2,y: 2),
//    "C7":Cell(x: 2,y: 1),
//    "C8":Cell(x: 2,y: 0),
//
//    "D1":Cell(x: 3,y: 7),
//    "D2":Cell(x: 3,y: 6),
//    "D3":Cell(x: 3,y: 5),
//    "D4":Cell(x: 3,y: 4),
//    "D5":Cell(x: 3,y: 3),
//    "D6":Cell(x: 3,y: 2),
//    "D7":Cell(x: 3,y: 1),
//    "D8":Cell(x: 3,y: 0),
//
//    "E1":Cell(x: 4,y: 7),
//    "E2":Cell(x: 4,y: 6),
//    "E3":Cell(x: 4,y: 5),
//    "E4":Cell(x: 4,y: 4),
//    "E5":Cell(x: 4,y: 3),
//    "E6":Cell(x: 4,y: 2),
//    "E7":Cell(x: 4,y: 1),
//    "E8":Cell(x: 4,y: 0),
//
//    "F1":Cell(x: 5,y: 7),
//    "F2":Cell(x: 5,y: 6),
//    "F3":Cell(x: 5,y: 5),
//    "F4":Cell(x: 5,y: 4),
//    "F5":Cell(x: 5,y: 3),
//    "F6":Cell(x: 5,y: 2),
//    "F7":Cell(x: 5,y: 1),
//    "F8":Cell(x: 5,y: 0),
//
//    "G1":Cell(x: 6,y: 7),
//    "G2":Cell(x: 6,y: 6),
//    "G3":Cell(x: 6,y: 5),
//    "G4":Cell(x: 6,y: 4),
//    "G5":Cell(x: 6,y: 3),
//    "G6":Cell(x: 6,y: 2),
//    "G7":Cell(x: 6,y: 1),
//    "G8":Cell(x: 6,y: 0),
//
//    "H1":Cell(x: 7,y: 7),
//    "H2":Cell(x: 7,y: 6),
//    "H3":Cell(x: 7,y: 5),
//    "H4":Cell(x: 7,y: 4),
//    "H5":Cell(x: 7,y: 3),
//    "H6":Cell(x: 7,y: 2),
//    "H7":Cell(x: 7,y: 1),
//    "H8":Cell(x: 7,y: 0),
//]

