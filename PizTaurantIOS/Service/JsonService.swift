import Foundation


struct JsonService <T: Codable> {
    func readLocalJson(fileName : String, type : String) -> Data? {
        do{
            if let filePath = Bundle.main.path(forResource: fileName, ofType: type){
                let fileURL = URL(filePath: filePath)
                let data = try Data(contentsOf: fileURL)
                return data
            }
        }catch{
            return nil
        }
        return nil
    }
    
    func convertToModelList(data : Data?) -> [T] {
        do{
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let decode = try jsonDecoder.decode([T].self, from: data)
                return decode
            }
            return []
        }catch{
            print(error)
            return []
        }
    }
}
