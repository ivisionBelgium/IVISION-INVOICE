//
//  CLIENTSview.swift
//  INVOICES
//
//  Created by Koen Sas, Ivision Interactive Video & Media, http://www.ivision.be, koen@ivision.be on 26/09/2022.
//

import SwiftUI
import Firebase

struct CLIENTSview: View {
    
    @ObservedObject var vModel = ViewModel()
    
    @State var varClientName = ""
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var body: some View {
        
        
        ZStack{
            
            Image("BG_IV_CAMS")
                .resizable()
                .ignoresSafeArea()
                
            
            VStack(alignment: .leading){
                // List(vModel.lst, id: \.self) id: kan hier weg omdat de ClientFields struct identifiable is
                List(vModel.lst){ item in
                    
                    Text( item.varClientName).foregroundColor(.green)
                  // TextField("qsdsqdqd", text: $varClientName)
                    
                }
                
                Text("CLIENTS").font(.title).foregroundColor(.green)
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss() })
                {
                    Text("Dismissen maar")
                }
            }.padding()
        }
    }
    init(){
        
        vModel.getData()
    }
        
    
    
}


struct CLIENTSview_Previews: PreviewProvider {
    static var previews: some View {
        CLIENTSview()
    }
}
