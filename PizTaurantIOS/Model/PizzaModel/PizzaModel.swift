import Foundation


struct PizzaModel : Codable {
    var id : Int
    let pizzaName :String
    let pizzaIngredients : String
    let pizzaPrice : Double
    let image : String
    let status : Bool
    let discount : Bool
    let discountPrice : Double
    var choosePizzaPastry : [ChoosePizzaPastry]
    var pizzaSize : [PizzaSize]
}

struct ChoosePizzaPastry : Codable {
    var pastryName : String
    var status : Bool
    var defaultPastry : Bool
    var pastryIngredients : String
    
    private enum CodingKeys : String, CodingKey{
        case defaultPastry = "default"
        case status,pastryName,pastryIngredients
    }
}

struct PizzaSize : Codable{
    var pizzaSize : String
    var status : Bool
    var defaultSize : Bool
    var price : Double
    
    enum CodingKeys : String, CodingKey{
        case defaultSize = "default"
        case pizzaSize,status,price
    }
}
