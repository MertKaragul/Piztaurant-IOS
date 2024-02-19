import SwiftUI

struct ContentView: View {
    
    @ObservedObject 
    private var viewModel = ContentViewModel();
    
    
    var body: some View {
        VStack{
            switch self.viewModel.pizzaModelLiveData {
            case .Success(let data):
                if let nonData = data {
                    List{
                        ForEach(nonData, id: \.id){ model in
                            Text(model.pizzaName)
                        }
                    }
                }else{
                    VStack{
                        Text("Pizza cannot get please try again")
                    }.padding()
                }
                
            case .Error(let error):
                VStack{
                    Text(error ?? "Something went wrong")
                }.padding()
                
            }
        }
        .task {
            await viewModel.getPizzaData()
        }
    }
}

#Preview {
    ContentView()
}
