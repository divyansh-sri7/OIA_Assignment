//
//  LinksView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI

struct LinksView: View {
    let recent:[links]
    var body: some View {
        VStack(spacing: 20) {
            ForEach(recent) { link in
                
                LinkView(title: link.title, clicks: link.total_clicks, link: link.web_link, image: link.original_image,date: convertDateString(link.created_at) ?? "-")
            }
            
            Button(action: {}) {
                HStack {
                    Image("link")
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
        }
        .padding(.horizontal, 16)
    }
}

func convertDateString(_ dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX" // Input date format
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

    if let date = dateFormatter.date(from: dateString) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM yyyy" // Output date format
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        return outputFormatter.string(from: date)
    } else {
        return nil
    }
}

struct LinkView: View {
    let title : String
    let clicks : Int
    let link : String
    let image : String
    let date : String
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                AsyncImage(url: URL(string: image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                    Text(date)
                        .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                        .font(.system(size: 12))
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 2) {
                    Text(String(clicks))
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .semibold))
                    Text("Clicks")
                        .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                        .font(.system(size: 12))
                }
                .padding(.trailing)
            }
            HStack {
                Text(link)
                    .foregroundColor(Color(red: 14/255, green: 111/255, blue: 255/255))
                    .font(.system(size: 14))
                    .lineLimit(1)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(Color(red: 14/255, green: 111/255, blue: 255/255))
                        .padding(4.88)
                }
                .background(Color(red: 232/255, green: 241/255, blue: 255/255))
                .cornerRadius(8)
            }
            .padding(.horizontal, 12)
            .frame(height: 40)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 166/255, green: 199/255, blue: 255/255), style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .background(Color(red: 232/255, green: 241/255, blue: 255/255))
            )
        }
        .padding(.top, 12)
        .background(Color.white)
        .cornerRadius(8)
    }
}

#Preview {
    LinksView(recent: [])
}
