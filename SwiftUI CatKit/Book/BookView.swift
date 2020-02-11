//
//  BookView.swift
//  SwiftUI CatKit
//
//  Created by Luca Saldanha Schifino on 11/02/20.
//  Copyright © 2020 lucass. All rights reserved.
//

import SwiftUI

struct BookView: View {
    
    var book: Book
    var proxy: GeometryProxy
    
    var body: some View {
        
        VStack {
            Text(book.title)
                .fontWeight(.bold)
                .font(Font.system(.headline, design: .rounded))
                .minimumScaleFactor(0.75)
                .padding(.top)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .foregroundColor(.white)
            
            Image(book.imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .padding()
                .shadow(color: .gray, radius: 20)
        }
        .padding()
        .frame(width: max(proxy.size.width - proxy.frame(in: .global).midX, proxy.size.width),
               height: proxy.size.height - 50)
        .background(Image(book.imageName)
        .renderingMode(.original)
        .resizable()
        .scaledToFill()
        .opacity(1)
        .overlay(Color.rayWenderlichGreen)
        .blendMode(.multiply)
        .blur(radius: 1))
        .cornerRadius(10)
        .padding(.vertical)
        .shadow(radius: 3)
        .rotation3DEffect(Angle(degrees: Double(proxy.frame(in: .global).midX) / 40), axis: (x: -4, y: -3, z: -3))
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            BookView(book: Book.demoBooks.randomElement()!, proxy: proxy)
        }
    }
}
