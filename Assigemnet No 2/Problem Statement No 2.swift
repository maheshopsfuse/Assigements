func input() -> (P:Double, R: Double, T: Double)? {
    var P:Double?, R:Double?, T:Double?
    print("Enter Principle Amount : ")
    P = Double(readLine()!)!
    print("Enter Rate : ")
    R = Double(readLine()!)!
    print("Enter Time : ")
    T = Double(readLine()!)!
    if(P != nil && R != nil && T != nil){
        return (P!, R!, T!)
    }
    return nil
}

func calSI(P:Double, R: Double, T: Double) -> Double{
    return (P * R * T) / 100
}

if let result = input() {
    let P = result.P
    let T = result.T
    let R = result.R
    print(calSI(P: P, R: R, T: T))
}
    
    