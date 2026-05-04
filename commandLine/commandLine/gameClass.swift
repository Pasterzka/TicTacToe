//
//  gameClass.swift
//  
//
//  Created by Jakub Pastuszka on 04/05/2026.
//

class gameClass{
    // classes and structures
    var board: boardClass
    var score: scoreStruct
    
    // game configuration
    var isGameOn: Bool = true
    var isPvE: Bool = false
    var currentPlayer: String = "X"
    var startPlayer: String = "X"
    
    init() {
        self.board = boardClass()
        self.score = scoreStruct()
    }
    
    // printing game
    func printGame() -> Void {
        print("Now playing \(currentPlayer)")
        board.printBoard()
    }
    
    // player move
    func makeMovePlayer() -> Void{
        print("Enter the number of the position you want to place your \(currentPlayer)")
        
        var correctMove: Bool = false
        // move logic
        while !correctMove{
            if let input = readLine(), let move = Int(input), move >= 0, move < 9{
                if board.board[move] == " "{
                    board.board[move] = currentPlayer
                    correctMove = true
                }else{
                    print("That spot is already taken, try again")
                    correctMove = false
                }
            }else{
                print("That's not a valid number, try again")
                correctMove = false
            }
        }
    }
    
    // check is some one winnig
    func checkWinner() -> Bool{
        for i in 0...2{
            if board.board[i*3] == currentPlayer && board.board[i*3+1] == currentPlayer && board.board[i*3+2] == currentPlayer{
                return true
            }
            if board.board[i] == currentPlayer && board.board[i+3] == currentPlayer && board.board[i+6] == currentPlayer{
                return true
            }
        }
        
        if board.board[0] == currentPlayer && board.board[4] == currentPlayer && board.board[8] == currentPlayer{
            return true
        }
        
        if board.board[6] == currentPlayer && board.board[4] == currentPlayer && board.board[2] == currentPlayer{
            return true
        }
        
        return false
    }
    
    // check draw
    func isBoardFull() -> Bool{
        return !board.board.contains(" ")
    }
    
    // game loop
    func gameLoop() -> Void{
        
        while isGameOn{
            
            score.printScores()
            printGame()
            makeMovePlayer()
            
            if checkWinner(){
                isGameOn = false
                print("Congratulations, \(currentPlayer) you won!")
                
                if currentPlayer == "X"{
                    score.scoreX += 1
                }else{
                    score.scoreO += 1
                }
            }else if isBoardFull(){
                score.draws += 1
                isGameOn = false
                print("DRAW!")
            }else{
                currentPlayer = (currentPlayer == "X") ? "O" : "X"
            }
            
            if !isGameOn{
                
                board.printBoard()
                score.printScores()
                print("Wonna play next? (t/n)")
                if readLine() == "t"{
                    board.board = Array(repeating: " ", count: 9)
                    isGameOn = true
                    startPlayer = (startPlayer == "X") ? "O" : "X"
                    currentPlayer = startPlayer
                }else{
                    print("Thank you for a game! BYE!")
                }
            }
        }
        
    }
}
