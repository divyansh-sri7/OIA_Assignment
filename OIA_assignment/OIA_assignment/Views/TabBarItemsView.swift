//
//  TabBarItemsView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                TabBarItemView(icon: "link", title: "Links", isSelected: true)
                TabBarItemView(icon: "magzine", title: "Courses", isSelected: false)
                PlusButton(title: "", isSelected: false)
                TabBarItemView(icon: "speaker", title: "Campaigns", isSelected: false)
                TabBarItemView(icon: "user", title: "Profile", isSelected: false)
            }
            .padding(.top, 12)
        }
        .background(Color.white)
        .shadow(radius: 1)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TabBarItemView: View {
    var icon: String
    var title: String
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(icon)
                .font(.system(size: isSelected ? 19 : 16))
                .foregroundColor(isSelected ? .black : Color(red: 153/255, green: 156/255, blue: 160/255))
            if !title.isEmpty {
                Text(title)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(isSelected ? .black : Color(red: 153/255, green: 156/255, blue: 160/255))
            }
        }
        .padding(.horizontal, isSelected ? 20 : 8)
        .padding(.vertical, 6.5)
        .frame(maxWidth: .infinity)
        .background(isSelected && title.isEmpty ? Color(red: 14/255, green: 111/255, blue: 255/255) : Color.clear)
        .cornerRadius(isSelected && title.isEmpty ? 40 : 0)
    }
}
struct PlusButton: View {
    var title: String
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            
            ZStack {
                Circle()
                    .frame(height:60)
                    .foregroundStyle(Color.blue)
                Image(systemName: "plus")
                    .font(.system(size: 24))
                    .foregroundStyle(Color.white)
            }
        }
        .padding(.horizontal, isSelected ? 20 : 8)
        .padding(.vertical, 6.5)
        .frame(maxWidth: .infinity)
        .background(isSelected && title.isEmpty ? Color(red: 14/255, green: 111/255, blue: 255/255) : Color.clear)
        .cornerRadius(isSelected && title.isEmpty ? 40 : 0)
    }
}
#Preview {
    TabBarView()
}
