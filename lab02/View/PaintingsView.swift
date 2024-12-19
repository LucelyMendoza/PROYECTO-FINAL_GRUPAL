import SwiftUI

struct PaintingsView: View {
    @StateObject private var viewModel = PaintingsViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView(" Cargando pinturas...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            ForEach(viewModel.paintings) { painting in
                                NavigationLink(destination: PaintingDetailView(painting: painting)) {
                                    PaintingRow(painting: painting)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .onAppear {
                viewModel.fetchPaintings()
            }
        }
    }
}

struct PaintingRow: View {
    let painting: Painting

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: painting.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 120)
                    .cornerRadius(5)
                    .clipped()
            } placeholder: {
                ProgressView()
            }

            Text("Pintura: \(painting.painting)")
                .font(.headline)

            Text("Artista: \(painting.artist)")
                .font(.subheadline)

            Text("Técnica: \(painting.technique)")
                .font(.subheadline)

            /*Text("Price: \(painting.description)")
                .font(.subheadline)*/
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}