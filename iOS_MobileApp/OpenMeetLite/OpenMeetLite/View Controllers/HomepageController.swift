//
//  HomepageController.swift
//  OpenMeetLite
//
//  Created by Yuri on 08/02/23.
//

import UIKit
import CoreLocation

class HomepageController: UIViewController {
    
    @IBOutlet weak var loadingindicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var basicInfo: UILabel!
    @IBOutlet weak var locationInfo: UILabel!
    @IBOutlet weak var interestInfo: UILabel!
    @IBOutlet var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    
    @IBOutlet weak var heartLogo: UIImageView!
    @IBOutlet weak var skipLogo: UIImageView!
    
    var parameters: [String: Any] = [
        "name": "",
        "surname": "",
        "gender": "",
        "searching_gender": "",
        "age": 0,
        "interests" : "",
        "latitude" : 0.0,
        "longitude" : 0.0
    ]
    
    var meeters = Array<[String: Any]>()
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = 8.0
        setParameters()
        
        let url = URL(string: "http://185.229.236.190:5000?\(encode(parameters: parameters))")!
        makeHttpPostRequest(url: url)
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func makeHttpPostRequest(url: URL) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        
        request.timeoutInterval = 20
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let jsonVals = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Array<[String: Any]>
                    if(jsonVals != nil){
                        print(jsonVals![0] as Any)
                        DispatchQueue.main.async {
                            self.loadingindicator.stopAnimating()
                            self.meeters = jsonVals!
                            self.displayNextMeeter()
                        }
                    }
                } catch {
                    print(error)
                }
            }
            else if let error = error {
               print(error)
             }
        }.resume()
        
    }
    func setParameters(){
        let m = doRetrieveMeeter()
        parameters["name"] = m.name
        parameters["surname"] = m.surname
        parameters["gender"] = m.gender
        parameters["searching_gender"] = m.searchingGender
        parameters["age"] = m.age
        parameters["interests"] = m.interests
        parameters["latitude"] = m.latitude
        parameters["longitude"] = m.longitude
    }
    func encode(parameters: [String: Any]) -> String {
      let parameterArray = parameters.map { key, value in
        let percentEscapedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let percentEscapedValue = String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return "\(percentEscapedKey)=\(percentEscapedValue)"
      }

      return parameterArray.joined(separator: "&")
    }
    
    func displayNextMeeter(){
    
        if(index >= meeters.count){
            showCompletedArrayAlert()
            return
        }
        
        basicInfo.text = "\(String(describing: meeters[index]["name"]!)) \(String(describing: meeters[index]["surname"]!)), \(String(describing: meeters[index]["age"]!))"

         getCityFromCoordinates(latitude: meeters[index]["latitude"] as! Double, longitude: meeters[index]["longitude"] as! Double)
        
        interestInfo.text = String(describing: meeters[index]["interests"]!)
        
        switch(String(describing: meeters[index]["gender"]!)){
            case "F": imageView.image = UIImage(named: "female.png");break
            case "M": imageView.image = UIImage(named: "male.png");break
            case "N": imageView.image = UIImage(named: "nonbin.png");break
            default: imageView.image = UIImage(named: "nonbin.png")
        }
   
        index += 1
    }
    
    func getCityFromCoordinates(latitude: Double, longitude: Double){
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocode failed with error: \(error)")
            }
            
            if let placemarks = placemarks, let placemark = placemarks.first
            {
                let city = placemark.locality ?? ""
                print(city)
                self.locationInfo.text = city
            }
            
        }
    }
    
    func showCompletedArrayAlert(){
        let alert = UIAlertController(title: "We have no more users for you", message: "Wow, you swiped a lot.\nGet a life and go out you nerd.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func handleRightSwipe(_ sender: UISwipeGestureRecognizer) {
        print("Swiped right")
        UIView.animate(withDuration: 2, delay: 0){
            self.skipLogo.alpha = 1
            self.skipLogo.alpha = 0
        }
        
        displayNextMeeter()
        
    }
 
    
    @IBAction func handleLeftSwipe(_ sender: UISwipeGestureRecognizer) {
        print("Swiped left")
        UIView.animate(withDuration: 1, delay: 0){
            self.heartLogo.alpha = 1
            self.heartLogo.alpha = 0
        }
        
        displayNextMeeter()
    }
    
    
}
