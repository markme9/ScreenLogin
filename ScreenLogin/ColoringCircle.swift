//
//  ColoringCircle.swift
//  ScreenLogin
//
//  Created by zoya me on 10/20/22.
//

import SwiftUI

struct ColoringCircle: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(Color.blue.opacity(0.3))
                .offset(x: 100, y: 300)
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(Color.green.opacity(0.3))
                .offset(x: -100, y: 400)
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(Color(uiColor: .magenta).opacity(0.3))
                .offset(x: 100, y: -400)
            Circle()
                .frame(width: 400, height: 300)
                .foregroundColor(Color.black.opacity(0.3))
                .offset(x: 120, y: -160)
            
            Circle()
                .frame(width: 350, height: 500)
                .foregroundColor(Color.pink.opacity(0.4))
                .offset(x: -170, y: 160)
            Circle()
                .frame(width: 310, height: 300)
                .foregroundColor(Color.yellow.opacity(0.7))
                .offset(x: -130, y: -90)
            Circle()
                .frame(width: 400, height: 300)
                .foregroundColor(Color.orange.opacity(0.5))
                .offset(x: -100, y: -300)
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(Color.purple.opacity(0.5))
                .offset(x: 100, y: 70)
        }
    }
}

struct ColoringCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColoringCircle()
    }
}
