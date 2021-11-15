//
//  ViewController.swift
//  Rickandmorty
//
//  Created by شروق فرج سويلم الحويطي on 09/04/1443 AH.
//

import UIKit

struct  factsresponse: Codable {
    var facts : [String]

}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getCharacters(){
        var urIComponents = URLComponents()
        urIComponents.scheme = "http"
        urIComponents.host = "dog-api.kinduff.com"
        urIComponents.path = "/api/facts?number=5"
        
        
        var urIRequest = URLRequest(url: urIComponents.url!)
        let urISession = URLSession.shared
        
        let task = urISession.dataTask(with: urIRequest)
        {
            (date:Data?, responce: URLResponse?, error:Error?) in
            //{ (data: Data?, response: URLResponse?, error: Error?) in
            do {
                let jsonDecoder = JSONDecoder()
                let facts = try jsonDecoder.decode([factsresponse].self, from: data!)
                //                print(String(data: data, encoding: .utf8))
                
            }
            
            task.resume()
        }
    }
}
