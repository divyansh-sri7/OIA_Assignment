//
//  OverviewChartView.swift
//  OIA_assignment
//
//  Created by Divyansh Srivastava on 19/05/24.
//

import SwiftUI
import Charts

struct OverviewChartView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Overview")
                    .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                    .font(.system(size: 14))
                Spacer()
                Button(action: {}) {
                    HStack {
                        Text("22 Aug - 23 Sept")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                        Image("clock")
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black.opacity(0.08), lineWidth: 1)
                    )
                }
            }
            .padding(.horizontal, 12)
            .padding(.top, 16)
            
            ChartView()
                .padding(.top, 36)
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 1)
        .padding(.horizontal, 16)
    }
}

struct ChartView: View {
    let dataPoints: [Data] = [
        .init(month: "Jan", amount: 26),
        .init(month: "Feb", amount: 50),
        .init(month: "Mar", amount: 80),
        .init(month: "Apr", amount: 75),
        .init(month: "May", amount: 100),
        .init(month: "Jun", amount: 50),
        .init(month: "Jul", amount: 25),
        .init(month: "Aug", amount: 100)
    ]
    var body: some View {
        ZStack {
            Chart(dataPoints) { cost in
                LineMark(
                    x: .value("Month", cost.month),
                    y: .value("Amount", cost.amount)
                )
            }
            .aspectRatio(2, contentMode: .fit)
            .padding(.horizontal)
            .padding(.bottom)
            Chart(dataPoints) { cost in
                AreaMark(
                    x: .value("Month", cost.month),
                    y: .value("Amount", cost.amount)
                )
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.4), Color.blue.opacity(0)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .aspectRatio(2, contentMode: .fit)
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    OverviewChartView()
}
