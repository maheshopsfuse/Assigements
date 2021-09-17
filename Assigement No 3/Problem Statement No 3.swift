//var students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
//students.sort()

/*students.sort{ (lhs: String, rhs: String) -> Bool in
    return lhs > rhs
}
*/
/*students.sort{ (lhs: String, rhs: String) -> Bool in
    return lhs < rhs
}*/

//let sortedStudents = students.sorted()

/*let sortedStudents = students.sorted { (lhs: String, rhs: String) -> Bool in
    return lhs > rhs
}

print(sortedStudents)
*/

struct Person {
    var name: String
    var age: Int
}

let personOne = Person(name: "Doris", age: 88)
let personTwo = Person(name: "Ahmed", age: 22)
let personThree = Person(name: "Trish", age: 25)
let personFour = Person(name: "Ahmed", age: 45)
var personArray = [personOne, personTwo, personThree, personFour]

print(personArray)
/*personArray.sort{
    $0.name < $1.name
}*/

personArray.sort{
if $0.name == $1.name {
    return $0.age > $1.age
}
return $0.name < $1.name
}

print(personArray)
