//
//  AnalyticsButtonView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI

struct AnalyticsButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Image("Arrows")
                    .foregroundColor(.black)
                Text("View Analytics")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 216/255, green: 216/255, blue: 216/255), lineWidth: 1)
            )
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AnalyticsButton()
}
