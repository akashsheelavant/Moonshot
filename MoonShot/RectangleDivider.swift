//
//  RectangleDivider.swift
//  MoonShot
//
//  Created by Akash Sheelavant on 7/6/24.
//

import SwiftUI

struct RectangleDivider: View {
    let height: CGFloat
    let style: Color
    let font: Font?
    
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundStyle(style)
            .padding(.vertical)
            .font(font)
    }
    
    init(height: CGFloat, style: Color, font: Font?) {
        self.height = height
        self.style = style
        self.font = font
    }
}

#Preview {
    RectangleDivider(height: 2, style: .lightBackground, font: .title.bold())
}
