//
//  CALLSHEETDETAILview.swift
//  INVOICES
//
//  Created by Koen Sas, Ivision Interactive Video & Media, http://www.ivision.be, koen@ivision.be on 26/09/2022.
//

import SwiftUI
import Firebase

struct CALLSHEETDETAILview: View {
    var body: some View {
        
        
        VStack(alignment: .leading){
            
            Text("CALLSHEET DETAILS").font(.title).foregroundColor(.green)
            Spacer()
            
            Button("Back to callsheet list") {
                
            }
            
        }
    }
}

struct CALLSHEETDETAILview_Previews: PreviewProvider {
    static var previews: some View {
        CALLSHEETDETAILview()
    }
}
