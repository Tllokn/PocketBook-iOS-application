//
//  ModelData.swift
//  PocketBook
//
//  Created by 孙鲁喆 on 2022/3/14.
//

import Foundation
import Combine

final class ModelData:ObservableObject{
    @Published var bills:[Bill]=BillLoader.load()
    
    func refresh()
    {
        bills=BillLoader.load()
    }
}

class BillLoader{
    
    static private let plistURL = Bundle.main.url(forResource: "BillRecords", withExtension: "plist")!
    
    static func load() -> [Bill] {
        let decoder = PropertyListDecoder()
        
        guard let decodeData = try? Data(contentsOf: plistURL)
        else { fatalError("Couldn't load bills from main bundle:\n") }
        
        do{
            return try decoder.decode([Bill].self, from: decodeData)
        }catch
        { fatalError("Couldn't load bills from main bundle:\n") }
    }
}

extension BillLoader{
    
    static func write(newBill: Bill)
    {
        var allBills=BillLoader.load()
        allBills.append(newBill)
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        guard let encodeData=try? encoder.encode(allBills)
        else{
            print("⚠️ Encode Fail!")
            return
        }
        
        let str:String? = String(data: encodeData, encoding: .utf8)
        print(str!)
        
        if FileManager.default.fileExists(atPath: plistURL.path) {
            do {
                try encodeData.write(to: plistURL)
                print("😄 Write successfully")
            } catch {
                print("Write Fail")
            }
        } else {
            print("⚠️ Write Fail!")
        }
        
    }
    
    
}

extension BillLoader{
    
    static func delete(deleteBill: Bill)
    {
        let allBills=BillLoader.load()
        
        let filterBills=allBills.filter{ $0.id != deleteBill.id }
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        guard let encodeData=try? encoder.encode(filterBills)
        else{
            print("⚠️ Encode Fail!")
            return
        }
        
        let str:String? = String(data: encodeData, encoding: .utf8)
        print(str!)
        
        if FileManager.default.fileExists(atPath: plistURL.path) {
            do {
                try encodeData.write(to: plistURL)
                print("😄 Write successfully")
            } catch {
                print("Write Fail")
            }
        } else {
            print("⚠️ Write Fail!")
        }
        
    }
}
