//
//  QuickStatsView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI

struct QuickStatsView: View {
    let total_noOfLinks : Int
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                QuickStatView(iconColor: Color(red: 92/255, green: 51/255, blue: 207/255), icon: "click", title: String(total_noOfLinks), subtitle: "Today's clicks")
                QuickStatView(iconColor: Color(red: 14/255, green: 111/255, blue: 255/255), icon: "pin", title: "Ahamedab..", subtitle: "Top Location")
                QuickStatView(iconColor: Color(red: 255/255, green: 78/255, blue: 100/255), icon: "globe", title: "Instagram", subtitle: "Top source")
            }
        }
        .padding(.horizontal, 16)
    }
}

struct QuickStatView: View {
    var iconColor: Color
    var icon: String
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(iconColor.opacity(0.12))
                        .frame(width: 32, height: 32)
                    Image(icon)
                        .foregroundColor(iconColor)
                        .font(.system(size: 14))
                }
                Spacer()
            }
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    Text(subtitle)
                        .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                        .font(.system(size: 14))
                }
                Spacer()
            }
            Spacer()
        }
        .frame(width: 120,height: 120)
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(Color.white)
        .cornerRadius(8)
    }
}

#Preview {
    QuickStatsView(total_noOfLinks: 0)
}
