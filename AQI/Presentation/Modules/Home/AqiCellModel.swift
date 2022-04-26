//
//  AqiCellModel.swift
//  AQI
//
//  Created by Sujeet on 26/04/22.
//

import UIKit

class AqiCellModel: CellRepresentable {
    var rowHeight: CGFloat = 75
    
    var data: Aqi
    
    init(withData data: Aqi) {
        self.data = data
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AqiTableCell", for: indexPath) as! AqiTableCell
        cell.populateAqiCell(with: self)
        return cell
    }

}
