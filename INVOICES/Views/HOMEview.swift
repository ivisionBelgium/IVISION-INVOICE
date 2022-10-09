//
//  HOMEview.swift
//  INVOICES
//
//  Created by Koen Sas, Ivision Interactive Video & Media, http://www.ivision.be, koen@ivision.be on 26/09/2022.
//

import SwiftUI
import Firebase



struct HOMEview: View {
    
    // eerst State voor fixe values dan bindings om values van de textfields door te sturen
    
//    @State private var txtTitle:String = ""
//    @State private var txtRemarks:String =""
//    @Binding  var txtTitle:String
//    @Binding  var txtRemarks:String
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
//    let backgroundGradient = LinearGradient(
//        colors: [Color.red, Color.blue],
//        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack(alignment: .center){
           
            VStack(alignment: .leading){
                Text("HOME").font(.title).foregroundColor(.green)
                Spacer()
                
//                HStack(alignment: .center){
                
 //                   TextField("Title Invoer", text: $txtTitle).font(.largeTitle)
  //                  TextField("Hier de remarks", text: $txtRemarks).font(.headline)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss() })
                        {
                            Text("Dismissen maar")
                        }
//
            }.padding()
                .navigationBarTitle("Video")
            }
        }//.background(backgroundGradient)
    }


struct HOMEview_Previews: PreviewProvider {
    static var previews: some View {
        HOMEview()
    }
}
