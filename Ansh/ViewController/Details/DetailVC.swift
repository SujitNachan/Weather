//
//  DetailVC.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    fileprivate lazy var detailVM : DetailVM = {
        return DetailVM(vc: self)
    }()
    var weather: ManageObjectList?
    override func viewDidLoad() {
        super.viewDidLoad()
        detailVM.setWeather(weather: weather)
        title = detailVM.getWeather()?.name
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        if let weather = detailVM.getWeather() {
            weatherLabel.text = weather.weather?.desc
            let minTempPlaceHolder = AttributedTextComponent(text: "Min Temperature", font: UIFont.systemFont(ofSize: 13), color: UIColor.darkGray)
            let minTemp = AttributedTextComponent(text: weather.main?.temp_min?.description ?? "", font: UIFont.systemFont(ofSize: 14), color: UIColor.black)
            let maxTempPlaceHolder = AttributedTextComponent(text: "Max Temperature", font: UIFont.systemFont(ofSize: 13), color: UIColor.darkGray)
            let maxTemp = AttributedTextComponent(text: weather.main?.temp_max?.description ?? "", font: UIFont.systemFont(ofSize: 14), color: UIColor.black)
 
            let humidityPlaceHolder = AttributedTextComponent(text: "\nHumidity", font: UIFont.systemFont(ofSize: 13), color: UIColor.darkGray)
            let humidity = AttributedTextComponent(text: weather.main?.humidity?.description ?? "", font: UIFont.systemFont(ofSize: 14), color: UIColor.black)
            let pressurePlaceHolder = AttributedTextComponent(text: "\nPressure", font: UIFont.systemFont(ofSize: 13), color: UIColor.darkGray)
            let pressure = AttributedTextComponent(text: weather.main?.pressure?.description ?? "", font: UIFont.systemFont(ofSize: 14), color: UIColor.black)
            
            leftLabel.attributedText = AttributedText(components: [minTempPlaceHolder,minTemp,humidityPlaceHolder,humidity], separator: "\n").attributedString()
            rightLabel.attributedText = AttributedText(components: [maxTempPlaceHolder,maxTemp,pressurePlaceHolder,pressure], separator: "\n").attributedString()
        }
    }

}
