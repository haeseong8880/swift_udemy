//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by haeseongJung on 2022/05/26.
//

import UIKit

class WeatherViewController: UIViewController {

    let cities = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        guard let city = cities.randomElement() else { return }
        guard let weather = weathers.randomElement() else { return }
        
        let randomTemp = Int.random(in: 10..<30)
        
        cityLabel.text = city
        weatherImageView.image = UIImage(systemName: weather)?.withRenderingMode(.alwaysOriginal)
        temperatureLabel.text = "\(randomTemp)°"
        
    }

}
