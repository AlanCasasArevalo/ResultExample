//
//  ResultViewController.swift
//  ResultExample
//
//  Created by Alan Casas on 06/05/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    let urlString = "https://api.myjson.com/bins/hjuw4"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchResultFromAPI { (res) in
            switch res {
            case .success(let courses):
                courses.forEach({ (course) in
                    print(course.self)
                })
            case .failure(let error):
                print("Failed to fetch object", error)
            }
        }
    }

    func fetchResultFromAPI (completionHandler: @escaping (Result<[TVResult], Error>) -> ()) {
        
    
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completionHandler(.failure(error))
                return
            } else {
                do {
                    let tvResults = try JSONDecoder().decode([TVResult].self, from: data!)
                    completionHandler(.success(tvResults))
                }catch let jsonError {
                    completionHandler(.failure(jsonError))
                }
            }

        }.resume()

    }

}
