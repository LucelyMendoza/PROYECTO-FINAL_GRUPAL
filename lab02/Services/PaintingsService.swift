import Foundation
import Combine

class PaintingsService {
    func fetchPaintings(completion: @escaping (Result<PaintingResponse, Error>) -> Void) {
        guard let url = URL(string: "https://api-6wjqso2dvq-uc.a.run.app") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let paintingResponse = try JSONDecoder().decode(PaintingResponse.self, from: data)
                completion(.success(paintingResponse))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
