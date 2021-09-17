import Foundation

func countWords(words: String) -> Int {
    var count = 1
    for i in words{
        if i == " " {
            count += 1
        }
    }
    return count
}
func countVowels(words: String) -> Int {
    var count = 0
    for i in words{
        if i.lowercased() == "a" || i == "e" || i == "i" || i == "o" || i == "u" {
            count += 1
        }
    }
    return count
}
func checkIsPalindrome(str: String) -> Bool{
    
    /*for i in stride(from: str.count - 1, to: -1, by: -1) {
        print(i)
        flag = true
    }*/
    var reversed = ""
    for char in str{
        reversed = "\(char)" + reversed
    }
    if str == reversed{
        return true
    }
    return false
}
func replaceChar(str: String , replace: String, newCh: String) -> String{
    //print(replace + newCh)
    let newStr = str.replacingOccurrences(of: replace, with: newCh)
    return newStr
}
func appendString(str: String, newStr: String) -> String{
    return str + newStr
}

var choise:String?
repeat {
    print("""
    1) calculating number of words in a string,
    2) count the number of vowels,
    3) Check if is a palindrome,
    4) option to replace the specific character at the string,
    5) append the string with a new string entered
    """)
    print("Enter Your Choice : ")
    if let ch = readLine(){
        switch ch{
            case "1":
                print("Enter String to Count Words :")
                if let str = readLine() {
                    print(countWords(words: str))
                }
            case "2":
                print("Enter String to Count Vowels : ")
                if let str = readLine(){
                    print(countVowels(words: str))
                }
            case "3":
                print("Enter STring to Check Palindrome : ")
                if let str = readLine(){
                    print(checkIsPalindrome(str: str))
                }
            case "4":
                print("Enter String :")
                if let str = readLine(){
                    print("Enter Character to Replace :")
                    if let replace = readLine(){
                        print("Enter New Character : ")
                        if let ch = readLine(){
                            print(replaceChar(str: str, replace: replace, newCh: ch))
                        }
                    }
                }
            case "5":
                print("Enter String : ")
                if let str = readLine(){
                    print("Enter String to Append : ")
                    if let newStr = readLine(){
                        print(appendString(str: str, newStr: newStr))
                    }
                }
            default:
                print("Enter Correct Choice !!!")
        }
    }
    print("Do you want to continue? (Press y/n)")
    choise = readLine()!
    if choise != nil{
        print(choise!)
    }
} while (choise == "y")

