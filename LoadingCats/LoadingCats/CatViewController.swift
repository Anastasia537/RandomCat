//
//  PreviewViewController.swift
//  LoadingCats
//
//  Created by Nastenka on 15.01.22.
//

import UIKit

class CatViewController: UIViewController {
    
    
    struct BengalCatObject: Decodable {
        let url: String
    }
    
    @IBOutlet weak var imageCats: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.thecatapi.com/v1/images/search?breed_id=beng"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url)
        request.addValue("x-api-key", forHTTPHeaderField: "8c289dbf-cfc9-420b-942c-5bb5c4467274")
        
        DispatchQueue.global(qos: .userInitiated).async {
            URLSession.shared.dataTask(with: request, completionHandler: { data, response,error in
                guard let data = data else {return}
                guard error == nil else {return}
                
                var jsonImage: [BengalCatObject]?
                
                do {
                    try jsonImage = JSONDecoder().decode([BengalCatObject].self, from: data)
                }
                catch {
                    print("error \(error)")
                }
                guard let result = jsonImage else {
                    return
                }
                print(result)
                
                let randomCatUrl = result.first!.url
                let urlRandomCat = URL(string: randomCatUrl)!
                
                if let data = try? Data(contentsOf: urlRandomCat) {
                    DispatchQueue.main.async { [weak self] in
                        self?.imageCats.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
    }
}

