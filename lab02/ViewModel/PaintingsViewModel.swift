import SwiftUI
import Combine

class PaintingsViewModel: ObservableObject {
    @Published var paintings: [Painting] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    private let service = PaintingsService()

    func fetchPaintings() {
        isLoading = true
        service.fetchPaintings { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let paintingResponse):
                    self?.paintings = paintingResponse.data
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

