//
//  AlarmCard.swift
//  Get Up
//
//  Created by Anthony on 2/13/21.
//

import SwiftUI

enum Activity: String, CaseIterable, Identifiable {
    case Puzzle
    case Shake
    case Math
    case Match
    var id: String { self.rawValue }
}

struct AlarmCard: View {
    
    @State var alarmIsOn = true
    @State var selectedActivity = Activity.Puzzle.rawValue
    @State var wakeUp = Date()
    @State var snooze = false
    @State var currentSeconds = 3
    @State var showDays = false
    
    
    @State var sun = false
    @State var mon = true
    @State var tue = true
    @State var wed = true
    @State var thu = true
    @State var fri = true
    @State var sat = false
    
    
    var body: some View {
        VStack {
            VStack {
                HStack {
//                    //Wakeup Time
//                    DatePicker(
//                        "Wakeup Time",
//                        selection: $wakeUp,
//                        displayedComponents: [.hourAndMinute]) .labelsHidden()
                    //5:00 am
                    Text(wakeUp, style: .time).font(.system(size: 48, weight: .light)).foregroundColor(Color(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))).multilineTextAlignment(.center) .layoutPriority(50)
                    
                    Toggle("", isOn: $alarmIsOn)
                        .toggleStyle(SwitchToggleStyle(tint: Color("ToggleColor")))
                }
                .padding([.top, .leading, .trailing])
                VStack {
                    
                    Button(action: { withAnimation { showDays.toggle() } }, label: {
                        Text("M, T, W, Th, F")
                    })
                    if showDays {
                        HStack {
                            Button(action: { sun.toggle() }, label: { Text("Sun") })
                            Button(action: { mon.toggle() }, label: { Text("Mon") })
                            Button(action: { tue.toggle() }, label: { Text("Tue") })
                            Button(action: { wed.toggle() }, label: { Text("Wed") })
                            Button(action: { thu.toggle() }, label: { Text("Thu") })
                            Button(action: { fri.toggle() }, label: { Text("Fri") })
                            Button(action: { sat.toggle() }, label: { Text("Sat") })
                        }     .padding([.top, .bottom])
                    }
                    
                    //Activity Picker
                    HStack {
                        VStack {
                            Text("Activity")
                            //Shape
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9795918464660645, green: 0.9795918464660645, blue: 0.9795918464660645, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.661581814289093, green: 0.7336661219596863, blue: 0.7891156673431396, alpha: 0.8500000238418579)), lineWidth: 1.5)
                            
                            
                                Picker(selectedActivity, selection: $selectedActivity) {
                                    ForEach(Activity.allCases) { activity in
                                        Text(activity.rawValue)
                                    }
                                } .pickerStyle(MenuPickerStyle())
                            } .frame(width: 89.3, height: 22.7)
                        }
//                        Picker(String(seconds[currentSeconds]) + " Seconds", selection: $currentSeconds) {
//                            ForEach(0 ..< seconds.count) {
//                                Text("\(self.seconds[$0]) Seconds")
//                            }
//                        }
                        .padding(.leading)
                        Spacer()
                        VStack {
                            Text("Snooze")
                            //Shape
                            ZStack {
                                RoundedRectangle(cornerRadius: 2)
                                .fill(Color(#colorLiteral(red: 0.9795918464660645, green: 0.9795918464660645, blue: 0.9795918464660645, alpha: 1)))

                                RoundedRectangle(cornerRadius: 2)
                                .strokeBorder(Color(#colorLiteral(red: 0.661581814289093, green: 0.7336661219596863, blue: 0.7891156673431396, alpha: 0.8500000238418579)), lineWidth: 1.5)
                            
                            
                                Button(action: {snooze.toggle()}, label: {
                                    Text(String(snooze == true ? "Enabled" : "Disabled"))
                                })
                            } .frame(width: 89.3, height: 22.7)
                        }
                        
                    }
                    .padding(.all)
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            .background(Color(#colorLiteral(red: 0.7490196228, green: 0.8313725591, blue: 0.8941176534, alpha: 0.8690773667)))
            .cornerRadius(20)
            .foregroundColor(Color(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)))
            .accentColor(.black)
        }
    }
}

struct AlarmCard_Previews: PreviewProvider {
    static var previews: some View {
        AlarmCard().preferredColorScheme(.dark)
    }
}
