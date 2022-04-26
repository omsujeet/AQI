//
//  AqiTableView.swift
//  AQI
//
//  Created by Sujeet on 26/04/22.
//

import UIKit

class AqiTableView: BaseTableView {
    
    var rowSelectedAt: ((IndexPath?) -> ())?
    
    override func initialize() {
        super.initialize()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        rowSelectedAt?(indexPath)
    }
    
}
