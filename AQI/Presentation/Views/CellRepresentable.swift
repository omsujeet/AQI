//
//  CellRepresentable.swift
//  AQI
//
//  Created by Sujeet on 26/04/22.
//

import UIKit

protocol CellRepresentable {
    var rowHeight: CGFloat { get }
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
