//
//  HeaderView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Color(red: 14/255, green: 111/255, blue: 255/255)
                .frame(height: 160)
                .edgesIgnoringSafeArea(.top)
            HStack {
                Text("Dashboard")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .semibold))
                Spacer()
                Button(action: {}) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white.opacity(0.12))
                            .frame(width: 40, height: 40)
                        Image("wrench")
                            .font(.system(size: 26))
                            .foregroundStyle(Color.white)
                    }
                }
            }
            .offset(y:10)
            .padding(.horizontal)
        }
    }
}

#Preview {
    HeaderView()
}
