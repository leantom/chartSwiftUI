//
//  ContentView.swift
//  ChartSwiftUI
//
//  Created by quang on 24/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selected: Int = 0
    var colors:[Color] = [.blue,.brown]
    
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Hello, world!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Text("Button")
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 25) {
                    Text("Daily workout in Hrs")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack(spacing:15){
                        ForEach(workout_Data) {work in
                            VStack {
                                VStack {
                                    Spacer(minLength: 0)
                                    if selected == work.id {
                                        Text(getHrs(value:work.workout_In_Min)).padding(.bottom, 5)
                                    }
                                    RoundedShape().fill(LinearGradient(colors: selected == work.id ? colors : [Color.white.opacity(0.06)] , startPoint: .top, endPoint: .bottom))
                                        .cornerRadius(5)
                                        .frame(height:getHight(value: work.workout_In_Min))
                                    
                                }
                                .frame(height: 220)
                                .onTapGesture {
                                    withAnimation {
                                        selected = work.id
                                    }
                                    
                                }
                                
                                Text(work.day)
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(10)
                .padding()
                
                VStack(alignment: .leading, spacing: 25) {
                    HStack(spacing:15) {
                        
                        Text("Statistics")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "filemenu.and.cursorarrow")
                    }
                    ActivityView(selected: $selected)
                    
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(10)
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
    }
    
    func getHight(value: CGFloat) -> CGFloat {
        let hours = (value / 1440) * 200
        return CGFloat(hours)
    }
    
    func getHrs(value: CGFloat) -> String {
        let hrs = value/60
        let str = String(format: "%.1f", hrs)
        return str
    }
    
    
    
}

struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5, height: 5))
        return Path(path.cgPath)
    }
}


struct Daily: Identifiable {
    var id: Int
    var day: String
    var workout_In_Min: CGFloat
}

var workout_Data = [
    Daily(id: 0, day: "Day 1", workout_In_Min: 400),
    Daily(id: 1, day: "Day 2", workout_In_Min: 560),
    Daily(id: 2, day: "Day 3", workout_In_Min: 230),
    Daily(id: 3, day: "Day 4", workout_In_Min: 890),
    Daily(id: 4, day: "Day 5", workout_In_Min: 1000),
    Daily(id: 5, day: "Day 6", workout_In_Min: 370),
    Daily(id: 6, day: "Day 7", workout_In_Min: 700)
]


struct Stats: Identifiable {
    var id: Int
    var title: String
    var currentData: CGFloat
    var goal: CGFloat
    var color: Color
}

var stats_Data = [
    Stats(id: 0, title: "Running", currentData: 6.8, goal: 15, color: Color.cyan),
    Stats(id: 1, title: "Water", currentData: 1.2, goal: 2, color: Color.green),
    Stats(id: 2, title: "Energy Burn", currentData: 300, goal: 1500, color: Color.gray),
    Stats(id: 3, title: "Sleep", currentData: 7, goal: 8, color: Color.yellow),
    Stats(id: 4, title: "Cycling", currentData: 14, goal: 25, color: Color.pink),
    Stats(id: 5, title: "Steps", currentData: 15000, goal: 20000, color: Color.red)
]






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
