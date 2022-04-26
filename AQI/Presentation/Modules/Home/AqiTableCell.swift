//
//  AqiTableCell.swift
//  AQI
//
//  Created by Sujeet on 26/04/22.
//

import UIKit

class AqiTableCell: UITableViewCell {

    @IBOutlet weak var btnCityName: UIButton!
    
    @IBOutlet weak var lblAqiValue: UILabel!
    @IBOutlet weak var lblLastUpdate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateAqiCell(with data: AqiCellModel ) {
        let model = data.data
        btnCityName.setTitle(model.cityName, for: .normal)
        if let aqi = model.aqiValue.last as? Double  {
            lblAqiValue.text = String(aqi)
            changeColour(for: aqi)
        }
        
        if let date = model.time.last {
            getUpdateTime(for: date)
        }
    }
    
    private func changeColour(for val: Double) {
        if val >= 0 , val <= 50 {
            lblAqiValue.backgroundColor = UIColor(named: "Good")
        }
        else if val > 50 , val <= 100 {
            lblAqiValue.backgroundColor = UIColor(named: "Satisffactory")
        }
        else if val > 100 , val <= 200 {
            lblAqiValue.backgroundColor = UIColor(named: "Moderate")
        }
        else if val > 200 , val <= 300 {
            lblAqiValue.backgroundColor = UIColor(named: "Poor")
        }
        else if val > 300 , val <= 400 {
            lblAqiValue.backgroundColor = UIColor(named: "VeryPoor")
        }
        else if val > 400 {
            lblAqiValue.backgroundColor = UIColor(named: "Severe")
        }
    }
    
    private func getUpdateTime(for time1 : Date)
    {
        let time2 = Date()
        let diff = time2.interval(ofComponent: .minute, fromDate: time1)
        if diff < 1 {
            lblLastUpdate.text = "Last Upddate: A few seconds ago"
        }
        else if diff > 1, diff < 60 {
            lblLastUpdate.text = "Last Upddate: " + String(diff) + " minute ago"
        }
        else {
            let formater = DateFormatter()
            formater.dateFormat = "hh:mm a"
            
            lblLastUpdate.text = "Last Upddate: " + formater.string(from: time1)
        }
    }
}
