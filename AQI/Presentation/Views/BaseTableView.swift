//
//  BaseTableView.swift
//  AQI
//
//  Created by Sujeet on 26/04/22.
//

import UIKit

class BaseTableView: UITableView {

    // MARK: - Properties
    
    var arrData: [CellRepresentable]?
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    func initialize() {
        
        //
        // Remove empty cells
        tableFooterView = UIView()
        
        //
        // Set dynamic cell height
        
        estimatedRowHeight = 70.0
        rowHeight = UITableView.automaticDimension
        
        //
        // Assigning delegates
        allowsSelection = true
        dataSource = self
        delegate = self
    }
}

extension BaseTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = arrData?[indexPath.row].cellInstance(tableView, indexPath: indexPath) ?? UITableViewCell()
        return cell
    }
}

extension BaseTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
