import Foundation


enum Resource<T> {
    case Success(data : T?)
    case Error(error : String?)
}
