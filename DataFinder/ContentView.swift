//
//  ContentView.swift
//  DataFinder
//
//  Created by Sumit on 23/01/25.
//

import SwiftUI

struct ContentView: View {
        
    
    @State var multipleThreadingLoopCount: Int = 123000

    @State var singleThreadingLoopCount: Int = 123000

    @State var totalCount: Int = 0
    
    @State var singleThreadingDataCount: Int = 0
    
    @State var multipleThreadingDataCount: Int = 0

    @State var startingExecutionTimming: String = ""

    @State var singleThreadingFinishingTimming: String = ""

    @State var multipleThreadingFinishingTimming: String = ""

    
    var body: some View {
  
        VStack {
            Text("Data loading....")
                 .padding(.top)
                 .font(.headline)

            ScrollView(.horizontal) {
                VStack(spacing:20) {
                    HStack(spacing: 20) {
                        ForEach(0..<8) {
                            Text("\($0)")
                                .frame(width:30,height:30)
                                .background(Color.red)
                                .cornerRadius(15)
                        }
                    }
                    HStack(spacing: 20) {
                        ForEach(8..<16) {
                            Text("\($0)")
                                .frame(width:30,height:30)
                                .background(Color.red)
                                .cornerRadius(15)
                        }
                    }
                }
            }
            .frame(width:380,height: 110)
             
             Text("Data loading execution timming -> Async, await,task information based @ @")
                 .padding([.leading,.bottom])
                 .fixedSize(horizontal: false, vertical: true)
                 .padding(.top,16)

             Button {
                startingExecutionTimming = printingDataLoadingTimeStam()

                Task {
                    multipleThreadingDataCount = await printDataMultipleThreading()
                  
                }
                    singleThreadingDataCount = printDataSingleThreading()
             } label: {
                 Text("Data loading timming check")
                     .padding(20)
                     .font(.headline)
             }
             .foregroundColor(.white)
             .background(Color(red: 0, green: 0, blue: 0.5))
             .clipShape(Capsule())
             .shadow(color:.gray,radius: 5)
             
             VStack(spacing: -17) {
                 Text("Starting of execution of Data loading timming.... \(startingExecutionTimming)")
                     .font(.system(size: 18, weight: .medium, design: .default))
                     .padding(.top,70)
                     .lineSpacing(5)
                     .lineLimit(2)
                     .multilineTextAlignment(.center)
                     .fixedSize(horizontal: false, vertical: true)
                 
                 Text("First execution Total Data count \(singleThreadingLoopCount)")
                     .padding(.top,70)
                 
                 Text("Single Threading Finishing Timming.... \(singleThreadingFinishingTimming)")
                     .padding(.top,70)
                     .multilineTextAlignment(.center)
                     .font(.system(size: 18, weight: .medium, design: .default))
                     .padding([.leading,.trailing])
                     .lineSpacing(5)
                     .fixedSize(horizontal: false, vertical: true)

                 
                 Text("Second execution \(multipleThreadingLoopCount)")
                     .padding(.top,40)
                 
                 Text("Multiple Threading Finishing Timming.... \(multipleThreadingFinishingTimming)")
                     .padding(.top,70)
                     .multilineTextAlignment(.center)
                     .font(.system(size: 18, weight: .medium, design: .default))
                     .padding([.leading,.trailing])
                     .lineSpacing(5)
                     .fixedSize(horizontal: false, vertical: true)

             }.padding([.leading,.trailing])
        }
         .background(.clear)
         
         Spacer()
    }
    
    
    func printDataMultipleThreading() async -> Int  {
        
        var count:Int = 0
        
        for index in 30...multipleThreadingLoopCount {
            print(index)
            print("Second execution...\(index)")
            count = index
         }
        
          multipleThreadingFinishingTimming = printingDataLoadingTimeStam()
        
         return count
    }
    
    
    func printDataSingleThreading() -> Int {
        
         var count:Int = 0

         for index in 1...singleThreadingLoopCount {
             print("first execution....\(index)")
             count = index
         }
        if count == singleThreadingLoopCount {
            singleThreadingFinishingTimming = printingDataLoadingTimeStam()
        }
         return count
     }
    
    func printingDataLoadingTimeStam()-> String {
        
        let date = Date()
        var calendar = Calendar.current

        if let timeZone = TimeZone(identifier: "UST") {
           calendar.timeZone = timeZone
        }
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        if minute < 10 {
            if minute < 10 && second < 10 {
                return "\(hour):0\(minute):0\(second)"
            } else {
                return "\(hour):0\(minute):\(second)"
            }
        } else if second < 10 {
            if minute < 10 && second < 10 {
                return "\(hour):0\(minute):0\(second)"
            } else {
                return "\(hour):\(minute):0\(second)"
            }
        } else {
            return "\(hour):\(minute):\(second)"
        }
    }

 }


#Preview {
    ContentView()
}


