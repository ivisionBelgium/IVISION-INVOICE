//
//  TitleTest.swift
//  INVOICES
//
//  Created by Koen Sas, Ivision Interactive Video & Media, http://www.ivision.be, koen@ivision.be on 27/09/2022.
//

import Foundation
import Combine
import Firebase

final class modTitleTransfer:ObservableObject {
    
    //puiblishes property wrapper om user interface te updaten
    @Published var txtTitle:String = ""
    @Published var txtRemark:String = ""
    var tezt:String = "sjoeppappe"
    var test2:Int = 17363535272
    
}
