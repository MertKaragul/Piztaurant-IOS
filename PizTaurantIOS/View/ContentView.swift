import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel();
    var body: some View {
        List{
            ForEach(viewModel.pizzaModel, id: \.id){ model in
                Text(model.pizzaName)
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
