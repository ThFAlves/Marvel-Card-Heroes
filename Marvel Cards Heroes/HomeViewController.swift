import SwiftUI

struct HomeViewController: View {
    var body: some View {
        GeometryReader { geometry in
            Image("background2")
            .resizable()
            .aspectRatio(geometry.size, contentMode: .fill)
                .opacity(0.25).background(Color.black)
                .edgesIgnoringSafeArea(.all)
            List {
                Text("Hello World").foregroundColor(.green).listRowBackground(Color.clear)
            }.listRowBackground(Color.green).background(Color.clear)
        }
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewController().previewLayout(.fixed(width: 600, height: 200))
    }
}
