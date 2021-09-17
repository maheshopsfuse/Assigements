func addition(n1:Int,n2:Int) ->Int{
    return n1 + n2
}
func addition(n1:Float,n2:Float) ->Float{
    return n1 + n2
}
func addition(n1: Double, n2: Double) -> Double{
    return n1 + n2
}

func subtraction(n1:Int,n2:Int) ->Int{
    return n1 - n2
}
func subtraction(n1:Float,n2:Float) ->Float{
    return n1 - n2
}
func subtraction(n1: Double, n2: Double) -> Double{
    return n1 - n2
}

func multiplication(n1:Int,n2:Int) ->Int{
    return n1 * n2
}
func multiplication(n1:Float,n2:Float) ->Float{
    return n1 * n2
}
func multiplication(n1: Double, n2: Double) -> Double{
    return n1 * n2
}

func division(n1:Int,n2:Int) ->Int{
    return n1 / n2
}
func division(n1:Float,n2:Float) ->Float{
    return n1 / n2
}
func division(n1: Double, n2: Double) -> Double{
    return n1 / n2
}

func input() -> (no1: String, no2: String)?{
    var n1:String?
    var n2:String?
    n1 = readLine()!
    n2 = readLine()!
    if(n1 != nil && n2 != nil){
        return (n1!, n2!)
    }
    return nil
}

func additionMenu(){
    var choise:String?
    repeat {
        print("""
            1) Addition of Int
            2) Addition of Float
            3) Addition of Double
        """)
        print("Enter Your Choice : ")
        if let ch = readLine(){
            switch ch{
                case "1":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(addition(n1: Int(no1)!, n2: Int(no2)!))
                    }
                case "2":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(addition(n1: Float(no1)!, n2: Float(no2)!))
                    }
                case "3":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(addition(n1: Double(no1)!, n2: Double(no2)!))
                    }
                default:
                    print("Enter Correct Choice !!!")
            }
        }
        print("Do you want to continue for Addition ? (Press y/n)")
        choise = readLine()!
        if choise != nil{
            print(choise!)
        }
    } while (choise == "y")
}

func subtractionMenu(){
    var choise:String?
    repeat {
        print("""
            1) Subtraction of Int
            2) Subtraction of Float
            3) Subtraction of Double
        """)
        print("Enter Your Choice : ")
        if let ch = readLine(){
            switch ch{
                case "1":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(subtraction(n1: Int(no1)!, n2: Int(no2)!))
                    }
                case "2":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(subtraction(n1: Float(no1)!, n2: Float(no2)!))
                    }
                case "3":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(subtraction(n1: Double(no1)!, n2: Double(no2)!))
                    }
                default:
                    print("Enter Correct Choice !!!")
            }
        }
        print("Do you want to continue for Subtraction ? (Press y/n)")
        choise = readLine()!
        if choise != nil{
            print(choise!)
        }
    } while (choise == "y")
}

func multiplicationMenu(){
    var choise:String?
    repeat {
        print("""
            1) Multiplication of Int
            2) Multiplication of Float
            3) Multiplication of Double
        """)
        print("Enter Your Choice : ")
        if let ch = readLine(){
            switch ch{
                case "1":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(multiplication(n1: Int(no1)!, n2: Int(no2)!))
                    }
                case "2":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(multiplication(n1: Float(no1)!, n2: Float(no2)!))
                    }
                case "3":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(multiplication(n1: Double(no1)!, n2: Double(no2)!))
                    }
                default:
                    print("Enter Correct Choice !!!")
            }
        }
        print("Do you want to continue for Multiplication ? (Press y/n)")
        choise = readLine()!
        if choise != nil{
            print(choise!)
        }
    } while (choise == "y")
}

func divisionMenu(){
    var choise:String?
    repeat {
        print("""
            1) Division of Int
            2) Division of Float
            3) Division of Double
        """)
        print("Enter Your Choice : ")
        if let ch = readLine(){
            switch ch{
                case "1":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(division(n1: Int(no1)!, n2: Int(no2)!))
                    }
                case "2":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(division(n1: Float(no1)!, n2: Float(no2)!))
                    }
                case "3":
                    if let result = input() {
                        let no1 = result.no1
                        let no2 = result.no2
                        print(division(n1: Double(no1)!, n2: Double(no2)!))
                    }
                default:
                    print("Enter Correct Choice !!!")
            }
        }
        print("Do you want to continue for Division ? (Press y/n)")
        choise = readLine()!
        if choise != nil{
            print(choise!)
        }
    } while (choise == "y")
}
var choise:String?
repeat {
    print("""
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
    """)
    print("Enter Your Choice : ")
    if let ch = readLine(){
        switch ch{
            case "1":
                additionMenu()
            case "2":
                subtractionMenu()
            case "3":
                multiplicationMenu()
            case "4":
               divisionMenu()
            default:
                print("Enter Correct Choice !!!")
        }
    }
    print("Do you want to continue for Mathematical Operations ? (Press y/n)")
    choise = readLine()!
    if choise != nil{
        print(choise!)
    }
} while (choise == "y")



