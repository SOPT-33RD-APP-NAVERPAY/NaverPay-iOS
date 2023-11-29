//
//  PieChartView.swift
//  NaverPay
//
//  Created by 이자민 on 2023/11/27.
//

import SwiftUI
import Charts
import UIKit

private let userPointData = UserPointAppData.dummy()


struct ChartData: Identifiable, Plottable {
    
    init?(primitivePlottable: Int) {
        self.primitivePlottable = primitivePlottable
        self.color = .adcard_blue
        self.name = "기본"
        self.amount = "1,000원"
    }
    
    init(primitivePlottableL: Int, color: UIColor, name: String, amount: String){
        self.primitivePlottable = primitivePlottableL
        self.color = color
        self.name = name
        self.amount = amount
    }
    
    var id = UUID()
    let primitivePlottable: Int
    let name: String
    let color: UIColor
    let amount: String
    
}

let data: [ChartData] = [
    .init(primitivePlottableL: userPointData.formattedPaymentPercentage, color: .graph_payment, name: "결제수단", amount: "\(userPointData.formattedPaymentPoint)원"),
    .init(primitivePlottableL: userPointData.formattedReviewPercentage, color: .graph_review, name: "리뷰", amount: "\(userPointData.formattedReviewPoint)원"),
    .init(primitivePlottableL: userPointData.formattedMembershipPercentage, color: .graph_membership, name: "멤버십", amount: "\(userPointData.formattedMembershipPoint)원"),
    .init(primitivePlottableL: userPointData.formattedBasicPercentage, color: .graph_main, name: "기본", amount: "\(userPointData.formattedBasicPoint)원")
].compactMap({$0})

struct PieChartView: View {
    let totalRange: ClosedRange<Int> = 0...100
    
    
    var body: some View{
        ZStack{
            ZStack{
                Chart(data) { item in
                    SectorMark(angle: .value("Label", item), innerRadius: 25)
                        .foregroundStyle(Color(item.color))
                        .annotation(position: .overlay) {
                            VStack{
                                Text("\(item.name)")
                                    .font(Font(UIFont.font(.detail_smbold_12)))
                                    .foregroundStyle(.white)
                                Text("\(item.amount)")
                                    .font(Font(UIFont.font(.detail_regular_10)))
                                    .foregroundStyle(.white)
                            }
                                                        
                            
                        }
                }
            }
            
            Circle()
                .foregroundColor(.white)
                .frame(width: 100)
            
            Text("2023.11.01. \n~ 11.30.")
                .font(Font(UIFont.font(.detail_smbold_12)))
                .multilineTextAlignment(.center)  // Center align the text
                .foregroundColor(Color(.grayscale_gray6))
            
        }
    
    }
    
    func calculatePosition(_ value: Int, in range: ClosedRange<Int>) -> CGPoint {
        let normalizedValue = CGFloat(value - range.lowerBound) / CGFloat(range.upperBound - range.lowerBound)
        let angle = .pi * 2 * normalizedValue
        let x = cos(angle) * 45 // Adjust the radius as needed
        let y = sin(angle) * 45 // Adjust the radius as needed
        return CGPoint(x: x, y: y)
    }
}



#Preview {
    PieChartView()
}
