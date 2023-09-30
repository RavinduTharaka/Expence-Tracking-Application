//
//  HomeScreen.swift
//  Expence Tracking Application
//
//  Created by Ravindu Tharaka Ranathunga on 2023-09-30.
//

//import SwiftUI
//
//enum Tab: String, CaseIterable{
//    case category
//    case expences
//    case budget
//}
//
//struct HomeScreen: View {
//    @Binding var selectedTab: Tab
//    private var fillImage: String{
//        selectedTab.rawValue + ".fill"
//    }
//    private var tabColor: Color {
//        switch selectedTab {
//        case .category:
//            return .blue
//        case .expences:
//            return .indigo
//        case .budget:
//            return .purple
//    
//        }
//    }
//    var body: some View {
//        VStack{
//            HStack{
//                ForEach(Tab.allCases, id: \.rawValue){
//                    tab in
//                    Spacer()
//                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
//                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
//                        .foregroundColor(tab == selectedTab ? tabColor: .gray)
//                        .font(.system(size: 22))
//                        .onTapGesture{
//                            withAnimation(.easeInOut(duration: 0.1)) {
//                                                            selectedTab = tab
//                                                        }
//                            
//                        }
//                    Spacer()
//                }
//                
//            }.frame(width: nil, height: 60)
//                .background(.thinMaterial)
//                .cornerRadius(10)
//                .padding()
//        }
//    }
//}
//
//struct HomeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeScreen(selectedTab: .constant(.category))
//    }
//}
