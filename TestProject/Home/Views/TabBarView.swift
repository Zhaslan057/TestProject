import SwiftUI

struct TabBarView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color : Color = .yellow
    @State var tabItemWidth: CGFloat = 0

    var body: some View {
        ZStack {
            HStack {
                buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 12)
            .frame(height: 98, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 23, style: .continuous))
            .overlay (
                overlay
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        }
    }

    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                    selectedTab = item.tab
            } label: {
                Image(systemName: item.icon)
                    .font(.system(size: 24))
                    .frame(width: 45, height: 35)
                    .frame(maxWidth: .infinity)
            }
            .foregroundColor(selectedTab == item.tab ? Color("IconForeground") : .gray)
            
            .overlay(
                GeometryReader { proxy in
                    //                                                Text("\(proxy.size.width)")
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    var overlay: some View {
        HStack {
            if selectedTab == .profile {
                Spacer()
                Spacer()
                Spacer()
            }
            if selectedTab == .favorite {
                Spacer()
            }
            if selectedTab == .messages {
                Spacer()
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(.gray)
                .frame(width: 45, height: 4)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .favorite {
                Spacer()
                Spacer()
                Spacer()
            }
            if selectedTab == .messages {
                Spacer()
            }
            if selectedTab == .home {
                Spacer()
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
