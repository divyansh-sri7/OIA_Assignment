//
//  WelcomeView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 25))
                .foregroundStyle(Color(red: 245/255, green: 245/255, blue: 245/255))
                .offset(y:-50)
            VStack(alignment: .leading, spacing: 8) {
                Text("Good morning")
                    .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                    .font(.system(size: 18))
                    .offset(y:-25)
                HStack {
                    Text("Divyansh Srivastava 👋")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .semibold))
                    Spacer()
                    Button(action: {}) {
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 28, height: 28)
                            .rotationEffect(.degrees(180))
                    }
                }
                .offset(y:-25)
            }
            .padding(.horizontal, 16)
        .padding(.top, 32)
        }
    }
}

#Preview {
    WelcomeView()
}
