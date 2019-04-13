//
//  ViewController.swift
//  WebAPIProject
//
//  Created by yonekan on 2019/04/07.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionData: [[String: Any]] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL = URL(string: "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/wa/wsSearch?term=marron5&limit=20")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            do {
                let items = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                
                var result: [[String: Any]] = []
                
                for(key, data) in items {
                    if (key as! String == "results"){
                        let resultArray = data as! NSArray
                        for (eachMusic) in resultArray{
                            let dicMusic:NSDictionary = eachMusic as! NSDictionary
                            
                            print(dicMusic["trackName"]!)
                            print(dicMusic["artworkUrl100"]!)
                            
                            let data: [String: Any] = ["name": dicMusic["trackName"]!, "imageUrl": dicMusic["artworkUrl100"]!]
                            
                            result.append(data)
                        }
                    }
                }
                
                DispatchQueue.main.async() { () -> Void in
                    self.collectionData = result
                }
                
            } catch {
                print(error)
            }
        })
        task.resume()
        
        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        var data = collectionData[indexPath.row]
        
        let url = URL(string: data["imageUrl"] as! String)
        
        let imageData :Data = (try! Data(contentsOf: url!,options: NSData.ReadingOptions.mappedIfSafe))
        let img = UIImage(data:imageData)
        
        cell.imageView.image = img
        cell.label.text = (data["name"] as! String)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.bounds.width/2 - 4
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
