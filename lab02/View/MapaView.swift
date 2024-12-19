//
//  MapaView.swift
//  lab02
//
//  Created by Lucely Mendoza on 3/10/24.
//

import SwiftUI

struct MapaView: View {
    var body: some View {
        NavigationStack{
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
                
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                Canvas { context, size in
                    let gallery1Rect = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.9, width: screenWidth * 0.5, height: screenHeight * 0.08)
                    let gallery2Rect = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.7, width: screenWidth * 0.15, height: screenHeight * 0.2)
                    let gallery3Rect = CGRect(x: screenWidth * 0.25, y: screenHeight * 0.7, width: screenWidth * 0.35, height: screenHeight * 0.08)
                    let gallery4Rect = CGRect(x: screenWidth * 0.75, y: screenHeight * 0.78, width: screenWidth * 0.15, height: screenHeight * 0.2)
                    let gallery5Rect = CGRect(x: screenWidth * 0.75, y: screenHeight * 0.7, width: screenWidth * 0.15, height: screenHeight * 0.08)
                    let gallery6Rect = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.4, width: screenWidth * 0.15, height: screenHeight * 0.2)
                    let galleryLaSalaRect = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.32, width: screenWidth * 0.5, height: screenHeight * 0.08)
                    let gallery7Rect = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.05, width: screenWidth * 0.8, height: screenHeight * 0.07)
                    let noIngreso1Rect = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.12, width: screenWidth * 0.15, height: screenHeight * 0.2)
                    let noIngreso2Rect = CGRect(x: screenWidth * 0.75, y: screenHeight * 0.32, width: screenWidth * 0.15, height: screenHeight * 0.3)
                    let bañosRect = CGRect(x: screenWidth * 0.75, y: screenHeight * 0.17, width: screenWidth * 0.15, height: screenHeight * 0.08)
                    let bordeRect = CGRect(x: screenWidth * 0.1, y: screenHeight * 0.05, width: screenWidth * 0.8, height: screenHeight * 0.93)
                    let center=CGPoint(x:screenWidth * 0.45, y: screenHeight * 0.22)
                    let radius: CGFloat = 30
                    let circlePath = Path { path in
                        path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
                        
                    }
                    
                    // Dibujar el círculo con color
                    context.stroke(circlePath, with: .color(.gray))
                    context.fill(circlePath, with: .color(.gray))
                    
                    // Color y ancho del borde
                    let border1Color = Color.black
                    let borderColor = Color.gray
                    let borderLineWidth: CGFloat = 4
                    
                    // Dibuja galerías con borde negro y fondo transparente
                    context.stroke(Path(gallery1Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(gallery2Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(gallery3Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(gallery4Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(gallery5Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(gallery6Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(galleryLaSalaRect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(gallery7Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(noIngreso1Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(noIngreso2Rect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(bañosRect), with: .color(borderColor), lineWidth: borderLineWidth)
                    context.stroke(Path(bordeRect), with: .color(border1Color), lineWidth: borderLineWidth)
                    
                    // Estilo de las letras de las galerìas
                    let textStyle = Font.system(size: 12)
                    let textColor = Color(red: 222 / 255, green: 166 / 255, blue: 23 / 255, opacity: 1)
                    
                    context.draw(Text("GALERÍA I").font(textStyle).foregroundColor(textColor), at: CGPoint(x: gallery1Rect.midX, y: gallery1Rect.midY))
                    context.draw(Text("GALERÍA II").font(textStyle).foregroundColor(textColor), at: CGPoint(x: gallery2Rect.midX, y: gallery2Rect.midY))
                    context.draw(Text("GALERÍA III").font(textStyle).foregroundColor(textColor), at: CGPoint(x: gallery3Rect.midX, y: gallery3Rect.midY))
                    context.draw(Text("GALERÍA IV").font(textStyle).foregroundColor(textColor), at: CGPoint(x: gallery4Rect.midX, y: gallery4Rect.midY))
                    context.draw(Text("GALERÍA V").font(textStyle).foregroundColor(textColor), at: CGPoint(x: gallery5Rect.midX, y: gallery5Rect.midY))
                    context.draw(Text("GALERÍA VI").font(textStyle).foregroundColor(textColor), at: CGPoint(x: gallery6Rect.midX, y: gallery6Rect.midY))
                    context.draw(Text("LA SALA").font(textStyle).foregroundColor(textColor), at: CGPoint(x: galleryLaSalaRect.midX, y: galleryLaSalaRect.midY))
                    context.draw(Text("GALERÍA VII").font(textStyle).foregroundColor(textColor), at: CGPoint(x: gallery7Rect.midX, y: gallery7Rect.midY))
                }
                                    NavigationLink(destination: Galeria1View()) {
                                        Rectangle()
                                            .fill(Color.clear) // Transparente para no cubrir la vista
                                            .frame(width: screenWidth * 0.5, height: screenHeight * 0.08)
                                            .position(x: screenWidth * 0.35, y: screenHeight * 0.94) // Centrado en el área de la galería
                                    }
            }
                    
                    //Portón
                    Image("porton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.8, height: screenHeight * 0.09) // Hacerla más pequeña
                        .position(x: screenWidth * 0.675, y: screenHeight * 0.94)
                    
                    //Puerta galeria 1
                    Image("door")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.65, y: screenHeight * 0.09)
                        .rotationEffect(.degrees(180))
                    
                    //Puerta galeria 2
                    Image("door 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.24, y: screenHeight * 0.83)
                   
                    //Puertas galeria 3
                    Image("door")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.4, y: screenHeight * 0.77)
                    
                    Image("door 3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.4, y: screenHeight * 0.71)
                    
                    //Puerta galeria 4
                    Image("door 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.76, y: screenHeight * 0.83)
                    
                    //Puerta galeria 5
                    Image("door 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.76, y: screenHeight * 0.74)
                    
                    //Puerta galeria 6
                    Image("door 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.24, y: screenHeight * 0.5)
                    
                    //Puerta La Sala
                    Image("door")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.4, y: screenHeight * 0.39)
                    
                    //Puerta galería 7
                    Image("door")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.65, y: screenHeight * 0.11)
                    
                    //prohibido entrar sala
                    Image("prohibido")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.05) // Hacerla más pequeña
                        .position(x: screenWidth * 0.65, y: screenHeight * 0.077)
                    
                    //Puerta sala sin pasada
                    Image("door 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.02) // Hacerla más pequeña
                        .position(x: screenWidth * 0.76, y: screenHeight * 0.49)
                    //prohibido entrar sala
                    Image("prohibido")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.05) // Hacerla más pequeña
                        .position(x: screenWidth * 0.83, y: screenHeight * 0.49)
                    
                    //baños entrada 1
                    Image("banios")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.3, height: screenHeight * 0.03) // Hacerla más pequeña
                        .position(x: screenWidth * 0.83, y: screenHeight * 0.23)
                    
                    //baños entrada 2
                    Image("banios 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.3, height: screenHeight * 0.03) // Hacerla más pequeña
                        .position(x: screenWidth * 0.83, y: screenHeight * 0.19)
                    
                    //prohibido entrar sala
                    Image("prohibido")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.05) // Hacerla más pequeña
                        .position(x: screenWidth * 0.18, y: screenHeight * 0.22)
                    
                    .frame(width: screenWidth, height: screenHeight)
                }
            }
        }
    }