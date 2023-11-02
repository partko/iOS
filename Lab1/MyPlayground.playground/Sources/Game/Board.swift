import Foundation

public class Board {
    // Board is quadratic
    var boardSize: Int = 0
    
    // The raw array
    private var data: [[Int]] = []
    
    private var full: [[Int]] = []
    
    // Initialize data array
    init (boardsize: Int) {
        for _ in 0...boardsize-1 {
            var row: [Int] = []
            for _ in 0...boardsize-1 {
                row.append(0)
            }
            data.append(row)
            full.append(row)
        }
        self.boardSize = boardsize
    }
    
    func cleanBoard() {
        data = []
        for _ in 0...self.boardSize-1 {
            var row: [Int] = []
            for _ in 0...boardSize-1 {
                row.append(0)
            }
            data.append(row)
        }
    }
    
    public func showBoard() {
        print("   A B C D E F G H\n")
        var i = 1
        for row in data {
            print("\(i) ", terminator: " ")
            for el in row {
                print(el+1, terminator: " ")
            }
            print()
            i+=1
        }
        //print("\n")
    }
    
    // Check if x and y are valid
    private func checkXY(x: Int, y: Int) -> Bool {
        if x <= boardSize && y <= boardSize {
            return true
        } else {
            return false
        }
    }
    
    // Return field at x,y
    func getField(x: Int, y: Int) -> Int {
        let row = self.data[x]
        return row[y]
    }
    
    // Set field data at x,y
    func setField(data: Int, x: Int, y: Int) {
        self.data[x][y] = data
    }
    
    func getFullField(x: Int, y: Int) -> Int {
        let row = self.full[x]
        return row[y]
    }
    
    func setFullField(full: Int, x: Int, y: Int) {
        self.full[x][y] = full
    }
    
}
