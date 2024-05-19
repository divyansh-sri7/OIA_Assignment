//
//  FooterButtonsView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI

struct FooterButtonView: View {
    var icon: String
    var title: String
    var backgroundColor: Color
    var borderColor: Color
    
    var body: some View {
        HStack {
            Image(icon)
                .foregroundColor(backgroundColor)
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 12)
        .padding(.vertical, 20)
        .background(backgroundColor.opacity(0.12))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(borderColor, lineWidth: 1)
        )
    }
}
struct FooterButtonsView: View {
    var body: some View {
        VStack(spacing: 16) {
            FooterButtonView(icon: "whatsapp", title: "Talk with us", backgroundColor: Color(red: 74/255, green: 209/255, blue: 95/255), borderColor: Color(red: 74/255, green: 209/255, blue: 95/255).opacity(0.32))
            FooterButtonView(icon: "quesMark", title: "Frequently Asked Questions", backgroundColor: Color(red: 232/255, green: 241/255, blue: 255/255), borderColor: Color(red: 14/255, green: 111/255, blue: 255/255).opacity(0.32))
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    FooterButtonsView()
}
