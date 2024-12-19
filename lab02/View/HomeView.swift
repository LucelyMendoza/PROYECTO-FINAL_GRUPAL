import SwiftUI

struct HomeView: View {
    @Binding var isLoggedin: Bool
    @StateObject private var viewModel = PaintingsViewModel() // Agrega el ViewModel

    var body: some View {
        VStack {
            Text("Welcome to my application!")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            if viewModel.paintings.isEmpty {
                ProgressView("Loading latest paintings...")
                    .onAppear {
                        viewModel.fetchPaintings()
                    }
            } else {
                TabView {
                    ForEach(viewModel.paintings.prefix(3)) { painting in
                        NavigationLink(destination: PaintingDetailView(painting: painting)) {
                            VStack {
                                AsyncImage(url: URL(string: painting.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 200)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text(painting.painting)
                                    .font(.headline)
                                    .padding(.top, 5)
                                Text("by \(painting.artist)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 300)
                .padding()
            }
        }
        .padding()
    }
}