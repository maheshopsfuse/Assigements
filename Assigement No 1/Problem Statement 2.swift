/*var i = 1,j = 1, n = 5
while i <= n{
    j = 1
    while j <= i{
        print("*",terminator:"")
        j += 1
    }
    print(" ")
    i += 1
}
i = 1
while i <= n{
    var v = n - i + 1
    j = 1
    while j <= v{
        j += 1
        print(" ",terminator:"")
    } 
    v = i
    j = 1
    while j <= v{
        j += 1
        print("*",terminator:"")
    } 
    i += 1
    print(" ")
} 
for i in 1...5{
     print(String.init(repeating: " ", count: 5-i) + String.init(repeating: "*", count: i))
}

for i in 1...5{
    print(String.init(repeating:"*",count: i) + String.init(repeating:" ", count: 5 - i))
}
for i in 1...5{
    for _ in 1...i{
        print("*",terminator:"")
    }
    print("")
}
print("")
for i in stride(from: 6, to: 1, by: -1){
    for _ in stride(from:i, to: 1, by: -1){
        print("*",terminator:"")
    }
    print("")
}
for i in 1...5{
    var n = 5 - i + 1
   for _ in 1...n{
       print(" ",terminator:"")
   }
   n = i
   for _ in 1...n{
       print("*",terminator:"")
   }
   print("")
}
print("")
for i in stride(from:6, to: 1, by: -1){
    var n = 6 - i + 1
    for _ in stride(from: n, to: 1, by: -1){
        print(" ",terminator:"")
    }
    n = i
    for _ in stride(from: n, to: 1, by: -1){
        print("*",terminator:"")
    }
    print("")
}
func printDiamond(n:Int){
    for i in 1...n - 1{
     for _ in i...n{
       print(" ",terminator:"")
     }
     for _ in 1...2*i-1{
       print("*",terminator:"")
     }
     print("")
   }
    for i in stride(from: n  , to: 0, by: -1){
        for _ in stride(from:n + 1, to: i, by: -1){
            print(" ",terminator:"")
        }
        for _ in 1...2*i-1{
            print("*",terminator:"")
        }
        print("")
    }
}
printDiamond(n: 2)*/
