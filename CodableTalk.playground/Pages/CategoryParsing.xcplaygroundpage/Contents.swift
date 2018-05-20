//: [Previous](@previous)

import Foundation

let data = """
{
    "category_id": "3",
    "category_name": "Nightlife"
}
""".data(using:.utf8)!

struct Category:Decodable {
    var category_id:String?
    var category_name:String?
}

let decoder = JSONDecoder()
let category = try? decoder.decode(Category.self, from: data)

//: [Next](@next)


