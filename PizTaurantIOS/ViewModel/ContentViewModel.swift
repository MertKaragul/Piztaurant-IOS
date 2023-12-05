import Foundation

class ContentViewModel : ObservableObject {
    private let jsonService = JsonService<PizzaModel>()
    
    @Published var pizzaModel : [PizzaModel] = []
    
    func getPizzaData() async {
        let json = jsonService.readLocalJson(fileName: "PizzaData", type: "json")
        if let json = json {
            let convertList = jsonService.convertToModelList(data: json)
            DispatchQueue.main.async {
                self.pizzaModel.append(contentsOf: convertList)
            }
        }
    }
    
    
}
