import SwiftUI
import AVFoundation

struct PaintingDetailView: View {
    let painting: Painting
    private let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Título "Detalles" en negrita y color negro, centrado
                Text("Detalles")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)  // Centrado

                // Imagen centrada
                AsyncImage(url: URL(string: painting.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)  // Imagen centrada
                        .cornerRadius(95)
                } placeholder: {
                    ProgressView()
                }

                // HStack para el nombre de la pintura y el icono de audio
                HStack {
                    // Nombre de la pintura alineado a la izquierda, con color guinda
                    Text("\(painting.painting)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBrown))
                    
                    // Icono de audio
                    Button(action: readPaintingDetails) {
                        Image(systemName: "speaker.2.fill")
                            .font(.title)  // Tamaño del icono
                        // foregroundColor(.black)  // Icono negro
                            .padding(4)
                            .background(Color(.systemGray6))  // Fondo gris claro
                            .cornerRadius(25)  // Forma redonda
                            .frame(width: 50, height: 50)  // Tamaño circular
                    }
                }

                // Información del artista alineada a la izquierda
                Text("Artista: \(painting.artist)")
                    .font(.headline)
                
                Text("Técnica: \(painting.technique)")
                    .font(.headline)
                
                Text("\(painting.description)")
                    .font(.headline)

            }
            .padding()
        }
    }
    
    private func readPaintingDetails() {
        let textToRead = """
        Detalles de la pintura:
        Pintura: \(painting.painting).
        Artista: \(painting.artist).
        Técnica: \(painting.technique).
        Descripción: \(painting.description).
        """
        
        let utterance = AVSpeechUtterance(string: textToRead)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")  // Configura el idioma a español
        utterance.rate = 0.5  // Configura la velocidad de lectura
        
        synthesizer.speak(utterance)  // Lee el texto en voz alta
    }
}

// Extensión para el color hexadecimal
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        self.init(
            .sRGB,
            red: Double((rgb >> 16) & 0xFF) / 255.0,
            green: Double((rgb >> 8) & 0xFF) / 255.0,
            blue: Double(rgb & 0xFF) / 255.0,
            opacity: 1.0
        )
    }
}