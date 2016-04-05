//
//  ViewController.swift
//  RealmDatabase2
//
//  Created by Dmytro on 3/8/16.
//  Copyright © 2016 Dmytro. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        databaseGet()
    }
    func copyFile(fileName :String, fileType :String) -> String?
    {
        let dirPaths =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let docsDir = dirPaths[0]
        let destPath = (docsDir as NSString).stringByAppendingPathComponent("/\(fileName).\(fileType)")
        let fileMgr = NSFileManager.defaultManager()
        
        if let path = NSBundle.mainBundle().pathForResource(fileName, ofType:fileType) {
            if (fileMgr.fileExistsAtPath(path) == false)
            {
            do{
              try! fileMgr.copyItemAtPath(path, toPath: destPath)
                return destPath
            }catch let error as NSError{
                print(error.localizedDescription)
                return destPath
            }
            }else{
            print("File already exist")
                return destPath
            }
            
        }
        return nil
    }
    
    func databaseGet () {

  
        let databasePath = copyFile("Database", fileType: "realm")
        let config = Realm.Configuration(path: databasePath)
        let realmDatabase = try! Realm(configuration: config)
        var newObject = RecipesDatabase()
        print(realmDatabase.path)
        var recipesDatabase = realmDatabase.objects(RecipesDatabase)
        try! realmDatabase.write(){
            realmDatabase.add(newObject)
            try! realmDatabase.commitWrite()
        }
        print(recipesDatabase.count)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

