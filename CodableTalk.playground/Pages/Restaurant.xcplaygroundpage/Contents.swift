//: [Previous](@previous)

import Foundation
let data = """
{
   "id":"16774318",
   "name":"Otto Enoteca & Pizzeria",
   "url":"https://www.zomato.com/new-york-city/otto-enoteca-pizzeria-greenwich-village",
   "cusine":"American",
   "location":{
      "address":"1 5th Avenue, New York, NY 10003",
      "locality":"Greenwich Village",
      "city":"New York City"
   },
   "average_cost_for_two":"60",
   "user_rating":{
      "aggregate_rating":"3.7",
      "rating_text":"Very Good",
      "rating_color":"5BA829",
      "votes":"1046"
   }
}
""".data(using:.utf8)!
//SRest
class Restaurant:Decodable {
    var id:String?
    var name:String?
    var url:String?
    var averageCostForTwo:String?
    var location:Location?
    
    var cusine:Cusine?
    enum Cusine:String,Codable {
        case asian = "Asian"
        case american = "American"
    }
    
    var aggregateRating:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case averageCostForTwo
        case location
        case userRating
        case cusine
    }
 
    enum UserRatingkeys: String, CodingKey {
        case aggregateRating
    }
  
    required init(from decoder:Decoder) {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.id = try! container?.decode(String.self, forKey: .id)
        self.name = try!
            container?.decode(String.self, forKey: .name)
        self.averageCostForTwo = try! container?.decode(String.self, forKey: .averageCostForTwo)
        self.url = try!
            container?.decode(String.self, forKey: .url)
        self.location = try! container?.decode(Location.self, forKey: .location)
        self.cusine = try! container?.decode(Cusine.self, forKey: .cusine)
        let ratingContainer = try! container?.nestedContainer(keyedBy: UserRatingkeys.self, forKey:.userRating)
        self.aggregateRating = try! ratingContainer?.decode(String.self, forKey: .aggregateRating)
    }
}

class Location:Decodable
{
    var address:String?
    var locality:String?
    var city:String?
}


let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
let restaurant = try? decoder.decode(Restaurant.self, from: data)

// There are few advanced case and examples to cover - may be in the next talk
