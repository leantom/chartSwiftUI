//
//  ActivityView.swift
//  ChartSwiftUI
//
//  Created by quang on 02/11/2021.
//

import SwiftUI

struct ActivityView: View {
   @Binding var selected: Int
    
    var colums = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: colums, spacing: 30) {
            ForEach (stats_Datas[selected]) {stat in
                VStack(spacing: 20) {
                    HStack {
                        Text(stat.title)
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    
                    ZStack {
                        
                        Circle()
                            .trim(from: 0, to: 1)
                            .stroke(stat.color.opacity(0.05), lineWidth: 10)
                            .frame(width: (UIScreen.main.bounds.width  - 150)/2, height: (UIScreen.main.bounds.width  - 150)/2, alignment: .center)
                        
                        Circle()
                            .trim(from: 0, to: (stat.currentData / stat.goal))
                            .stroke(stat.color, lineWidth: 10)
                            .frame(width: (UIScreen.main.bounds.width  - 150)/2, height: (UIScreen.main.bounds.width  - 150)/2, alignment: .center)
                            .rotationEffect(.degrees(-90))
                        
                        Text(getPercent(current: stat.currentData, goal: stat.goal))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(stat.color)
                    }
                    
                }
                .padding()
                .background(Color.white.opacity(0.05))
                    .cornerRadius(15)
            }
            
        }
    }
    
    
    func getPercent(current: CGFloat, goal: CGFloat) -> String {
        return String(format: "%.1f", current/goal*100)
    }
}


var stats_Datas = [[
    Stats(id: 0, title: "Running", currentData: 2.8, goal: 15, color: Color.cyan),
    Stats(id: 1, title: "Water", currentData: 1.6, goal: 2, color: Color.green),
    Stats(id: 2, title: "Energy Burn", currentData: 600, goal: 1500, color: Color.gray),
    Stats(id: 3, title: "Sleep", currentData: 4, goal: 8, color: Color.yellow),
    Stats(id: 4, title: "Cycling", currentData: 19, goal: 25, color: Color.pink),
    Stats(id: 5, title: "Steps", currentData: 11000, goal: 20000, color: Color.red)
],
                   [
                       Stats(id: 0, title: "Running", currentData: 4.0, goal: 15, color: Color.cyan),
                       Stats(id: 1, title: "Water", currentData: 1.6, goal: 2, color: Color.green),
                       Stats(id: 2, title: "Energy Burn", currentData: 800, goal: 1500, color: Color.gray),
                       Stats(id: 3, title: "Sleep", currentData: 2, goal: 8, color: Color.yellow),
                       Stats(id: 4, title: "Cycling", currentData: 20, goal: 25, color: Color.pink),
                       Stats(id: 5, title: "Steps", currentData: 10000, goal: 20000, color: Color.red)
                   ]
,
                   [
                       Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color.cyan),
                       Stats(id: 1, title: "Water", currentData: 1.2, goal: 2, color: Color.green),
                       Stats(id: 2, title: "Energy Burn", currentData: 300, goal: 1500, color: Color.gray),
                       Stats(id: 3, title: "Sleep", currentData: 7, goal: 8, color: Color.yellow),
                       Stats(id: 4, title: "Cycling", currentData: 14, goal: 25, color: Color.pink),
                       Stats(id: 5, title: "Steps", currentData: 15000, goal: 20000, color: Color.red)
                   ],
                   [
                       Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color.cyan),
                       Stats(id: 1, title: "Water", currentData: 1.2, goal: 2, color: Color.green),
                       Stats(id: 2, title: "Energy Burn", currentData: 300, goal: 1500, color: Color.gray),
                       Stats(id: 3, title: "Sleep", currentData: 7, goal: 8, color: Color.yellow),
                       Stats(id: 4, title: "Cycling", currentData: 14, goal: 25, color: Color.pink),
                       Stats(id: 5, title: "Steps", currentData: 15000, goal: 20000, color: Color.red)
                   ]
,
                   [
                       Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color.cyan),
                       Stats(id: 1, title: "Water", currentData: 1.2, goal: 2, color: Color.green),
                       Stats(id: 2, title: "Energy Burn", currentData: 300, goal: 1500, color: Color.gray),
                       Stats(id: 3, title: "Sleep", currentData: 7, goal: 8, color: Color.yellow),
                       Stats(id: 4, title: "Cycling", currentData: 14, goal: 25, color: Color.pink),
                       Stats(id: 5, title: "Steps", currentData: 16000, goal: 20000, color: Color.red)
                   ]
,
                   [
                       Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color.cyan),
                       Stats(id: 1, title: "Water", currentData: 1.2, goal: 2, color: Color.green),
                       Stats(id: 2, title: "Energy Burn", currentData: 300, goal: 1500, color: Color.gray),
                       Stats(id: 3, title: "Sleep", currentData: 7, goal: 8, color: Color.yellow),
                       Stats(id: 4, title: "Cycling", currentData: 14, goal: 25, color: Color.pink),
                       Stats(id: 5, title: "Steps", currentData: 15000, goal: 20000, color: Color.red)
                   ],
                   [
                       Stats(id: 0, title: "Running", currentData: 1.8, goal: 15, color: Color.cyan),
                       Stats(id: 1, title: "Water", currentData: 0.8, goal: 2, color: Color.green),
                       Stats(id: 2, title: "Energy Burn", currentData: 900, goal: 1500, color: Color.gray),
                       Stats(id: 3, title: "Sleep", currentData: 2, goal: 8, color: Color.yellow),
                       Stats(id: 4, title: "Cycling", currentData: 10, goal: 25, color: Color.pink),
                       Stats(id: 5, title: "Steps", currentData: 18000, goal: 20000, color: Color.red)
                   ]
]

