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
        self.fetchResultFromAPI { results, error in
            print(results!)
            print(error?.localizedDescription)
        }
    }

    func fetchResultFromAPI (completionHandler: @escaping ([TVResult]?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
                return
            } else {
                do {
                    let results = try JSONDecoder().decode([TVResult].self, from: data!)
                    completionHandler(results, nil)
                }catch let jsonError {
                    completionHandler(nil, jsonError)
                }
            }

        }.resume()

    }

}
