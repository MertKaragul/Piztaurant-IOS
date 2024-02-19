import Foundation

class ContentViewModel: ObservableObject {
    private let jsonService = JsonService<PizzaModel>()

    @Published
    var pizzaModelLiveData : Resource<[PizzaModel]> = .Error(error: "somet")

    
    
    // MARK: Get pizza list from local .json file. Check Resource -> PizzaData.json
    func getPizzaData() async {
        
        let json = jsonService.readLocalJson(fileName: "PizzaData", type: "json")
        
        if case let .Success(data) = json {
            if let getData = data {
                let convertList = jsonService.convertToModelList(data: getData)
                convertModel(convertModel: convertList )
            } else {
                DispatchQueue.main.async{
                    self.pizzaModelLiveData = .Error(error: "Pizza cannot convert to model")
                }
            }
        } else if case let .Error(error) = json {
            DispatchQueue.main.async {
                self.pizzaModelLiveData = .Error(error: error ?? "Something went wrong")
            }
        }
    }
    
    
    // MARK: If you get data from local .json file, you can want return to any model
    private func convertModel(convertModel : Resource<[PizzaModel]>) {
        if case let .Success(data) = convertModel {
            if let getData = data {
                DispatchQueue.main.async {
                    self.pizzaModelLiveData = .Success(data: getData)
                }
            }else{
                DispatchQueue.main.async {
                    self.pizzaModelLiveData = .Error(error: "Cannot get Pizza's, please try again")
                }
            }
        }else if case let .Error(err) = convertModel{
            DispatchQueue.main.async {
                self.pizzaModelLiveData = .Error(error: err ?? "Something went wrong")
            }
        }
    }
    
    
}
