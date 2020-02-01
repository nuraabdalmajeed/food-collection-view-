//
//  ViewController.swift
//  shallemo
//
//  Created by nura on 1/19/20.
//  Copyright © 2020 nura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
// deletate collection view ,datasource
var foodlist =  Array<fooditems>()
    @IBOutlet weak var collectionviewlist: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // read from list function
        ReadFromplist();
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.label.text=foodlist[indexPath.row].Name!
        cell.image.image=UIImage(named: foodlist[indexPath.row].Image!)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetails", sender: foodlist[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dis = segue.destination  as? ViewController2{
            if let fd = sender as? fooditems{
                dis.signalitem=fd
            }
        }}
    func ReadFromplist(){
    let  path=Bundle.main.path(forResource: "food", ofType: "plist")
        let url = URL(fileURLWithPath: path!)
    let data = try!Data(contentsOf: url)
    let plist = try!PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
    let dicArray=plist as! [[String:String]]
        for dic in dicArray{
            foodlist.append(fooditems(Name: dic["Name"]!, Image: dic["Image"]!, Des: dic["Des"]!))

        }
    }

}

