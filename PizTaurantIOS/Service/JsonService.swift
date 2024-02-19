import Foundation


struct JsonService <T: Codable> {
    
    
    func readLocalJson(fileName : String, type : String) -> Resource<Data?> {
        do{
            if let filePath = Bundle.main.path(forResource: fileName, ofType: type){
                let fileURL = URL(filePath: filePath)
                let data = try Data(contentsOf: fileURL)
                return .Success(data: data)
            }
        }catch{
            return .Error(error: error.localizedDescription)
        }
        return .Error(error: "Something went wrong, please try again")
    }
    
    func convertToModelList(data : Data?) -> Resource<[T]> {
        do{
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let decode = try jsonDecoder.decode([T].self, from: data)
                return .Success(data: decode)
            }
            return .Error(error: "Something went wrong")
        }catch{
            return .Error(error: error.localizedDescription)
        }
    }
}



