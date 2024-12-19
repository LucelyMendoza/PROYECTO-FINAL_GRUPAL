import SwiftUI
import Vision
import PhotosUI

struct QRView: View {
    @State private var selectedImage: UIImage?
    @State private var painting: Painting?
    @State private var isImagePickerPresented = false
    @State private var isCameraPresented = false
    @State private var message: String? // Para mostrar mensajes de error o éxito

    var body: some View {
        NavigationView {
            VStack {
                if let painting = painting {
                    PaintingDetailView(painting: painting)
                } else {
                    Text("Sube una imagen de un código QR para ver los detalles de la pintura.")
                        .font(.headline)
                        .padding()

                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }

                    if let message = message {
                        Text(message)
                            .foregroundColor(.red)
                            .padding()
                    }
                }

                HStack {
                    Button("Subir Imagen") {
                        isImagePickerPresented = true
                    }
                    .padding()

                    Button("Capturar Imagen") {
                        isCameraPresented = true
                    }
                    .padding()
                }
            }
            .navigationTitle("QR Scanner")
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage, completion: processQRCode)
            }
            .sheet(isPresented: $isCameraPresented) {
                ImagePicker(sourceType: .camera, selectedImage: $selectedImage, completion: processQRCode)
            }
            .onChange(of: selectedImage) { newImage in
                if let image = newImage {
                    processQRCode(from: image)
                }
            }
        }
    }

    private func processQRCode(from image: UIImage) {
        guard let cgImage = normalizedImage(image).cgImage else {
            message = "No se pudo procesar la imagen seleccionada."
            return
        }

        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNDetectBarcodesRequest { request, error in
            if let error = error {
                DispatchQueue.main.async {
                    message = "Error al analizar la imagen: \(error.localizedDescription)"
                }
                return
            }

            if let results = request.results as? [VNBarcodeObservation], !results.isEmpty {
                for result in results {
                    if result.symbology == .QR, let payloadString = result.payloadStringValue {
                        fetchPaintingData(withId: payloadString)
                        return
                    }
                }
                DispatchQueue.main.async {
                    message = "No se detectó ningún código QR válido."
                }
            } else {
                DispatchQueue.main.async {
                    message = "No se encontraron códigos QR en la imagen."
                }
            }
        }

        do {
            try requestHandler.perform([request])
        } catch {
            DispatchQueue.main.async {
                message = "Error al procesar la imagen: \(error.localizedDescription)"
            }
        }
    }

    private func fetchPaintingData(withId id: String) {
        let samplePaintings = [
            Painting(
                id: "0piYz0uIAxbNKMhUS3q6",
                painting: "Eight Elvises",
                artist: "Andy Warhol",
                /*adjustedPrice: "$109,500,000",
                originalPrice: "$100,000,000",
                dateOfSale: "1/10/2008",
                yearOfSale: 2008,
                seller: "Annibale Berlingieri",
                buyer: "",
                */
                technique: "Private sale",
                image: "http://upload.wikimedia.org/wikipedia/en/b/be/Eight_Elvises.jpg",
                description: "Painting of Andy Warhol"
            )
        ]

        if let foundPainting = samplePaintings.first(where: { $0.id == id }) {
            DispatchQueue.main.async {
                self.painting = foundPainting
                self.message = nil
            }
        } else {
            DispatchQueue.main.async {
                message = "Pintura no encontrada para el ID: \(id)"
            }
        }
    }

    private func normalizedImage(_ image: UIImage) -> UIImage {
        if image.imageOrientation == .up {
            return image
        }

        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: image.size))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext() ?? image
        UIGraphicsEndImageContext()
        return normalizedImage
    }
}
