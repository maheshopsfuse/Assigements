func findTwoLargestNumber(array:[Int]) -> (n1:Int, n2:Int)?{
    var newArray = array
    newArray.sort(by: >)
    
    return (newArray[0], newArray[1])
}
func findSumAndAvg(array:[Int]) ->(sum:Int, avg:Double)?{
   let numberSum = array.reduce(0, { x, y in
        x + y
    })
    return (numberSum,Double(numberSum / array.count))
}

func insertAt(at:Int, value:Int, array: [Int]) -> [Int]?{
    var newArray = array
    
    newArray.insert(value, at:at)
    
    return newArray
}

func deleteAt(at: Int,  array: [Int]) -> [Int]?{
    var newArray = array
    
    newArray.remove(at: at)
    
    return newArray
}

func mergeSort(array1: [Int], array2: [Int]) -> [Int]?{
    var array1 = array1, array2 = array2
    array1.append(contentsOf: array2)
    array1.sort()
    return array1
}

var array = [7,8,4,5,1,6,9,2,3]

print("Array : \(array)")

if let res = findTwoLargestNumber(array:array) {
    print("Largest Number : \(res.n1)")
    print("Second Largest Number : \(res.n2)")
}

if let res = findSumAndAvg(array:array){
    print("Sum : \(res.sum)")
    print("Avg : \(res.avg)")
}

if let res = insertAt(at:4, value:10, array:array){
    print("New Element Inserted at 4 : \(res)")
}

if let res = deleteAt(at:2, array:array){
    print("Element Deleted at 2 :\(res)")
}

if let res = mergeSort(array1:array, array2: [40, 8, 65, 23, 13]){
    print("Merge and Sorted Array : \(res)")
}
