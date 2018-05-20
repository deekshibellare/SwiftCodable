//: [Previous](@previous)

import Foundation

let data = """
[ {
    "category_id": "3",
    "category_name": "Nightlife"
},
{
    "category_id": "3",
    "category_name": "Nightlife"
}
]
""".data(using:.utf8)!
struct Category:Decodable {
    var id:String?
    var name:String?
    
    enum CodingKeys:String,CodingKey{
        case id = "category_id"
        case name = "category_name"
    }
}

let decoder = JSONDecoder()
let categories = try? decoder.decode([Category].self, from: data)
//: [Next](@next)
