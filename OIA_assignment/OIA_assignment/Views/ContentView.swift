import SwiftUI
import Charts

struct ContentView: View {
    @State var total_links : Int = 0
    @State var resultData = data(recent_links: [], top_links: [])
    @State private var selectedTab = "Top Links"
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                HeaderView()
                WelcomeView()
                OverviewChartView()
                QuickStatsView(total_noOfLinks: total_links)
                AnalyticsButton()
                HStack {
                    Text("Top Links")
                        .foregroundColor(selectedTab == "Top Links" ? .white : Color(red: 153/255, green: 156/255, blue: 160/255))
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(selectedTab == "Top Links" ? Color(red: 14/255, green: 111/255, blue: 255/255) : Color.clear)
                        .cornerRadius(22)
                        .onTapGesture {
                            selectedTab = "Top Links"
                        }

                    Text("Recent Links")
                        .foregroundColor(selectedTab == "Recent Links" ? .white : Color(red: 153/255, green: 156/255, blue: 160/255))
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(selectedTab == "Recent Links" ? Color(red: 14/255, green: 111/255, blue: 255/255) : Color.clear)
                        .cornerRadius(22)
                        .onTapGesture {
                            selectedTab = "Recent Links"
                        }

                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                            .padding(6)
                            .background(Color(red: 242/255, green: 242/255, blue: 242/255))
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                if(selectedTab == "Top Links"){
                    LinksView(recent: resultData.top_links)
                }
                else{
                    LinksView(recent: resultData.recent_links)
                }
                FooterButtonsView()
                Spacer(minLength: 77)
            }
            .background(Color(red: 245/255, green: 245/255, blue: 245/255))
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .background(Color.white)
        .overlay(
            TabBarView(),
            alignment: .bottom
        )
        .onAppear{
            performRequest()
        }
    }
    func performRequest() {
        let baseurl = "https://api.inopenapp.com/api/v1/dashboardNew"
        
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
        let url = URL(string: baseurl)
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(ApiData.self, from: data)
                print(decodedData)
                DispatchQueue.main.async {
                    total_links = decodedData.total_clicks
                    resultData = decodedData.data
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

#Preview{
    ContentView()
}

