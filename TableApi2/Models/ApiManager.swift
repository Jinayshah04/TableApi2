//
//  ApiManager.swift
//  TableApi2
//
//  Created by Admin2 on 03/10/24.
//

import Foundation
import Alamofire

class ApiManager{
    let url = "https://official-joke-api.appspot.com/jokes/random/5"
    
    func fetchAF(completionHandler:@escaping(Result<[JokeModel],Error>)->Void){
        AF.request(url).responseDecodable(of:[JokeModel].self) { response in
            switch response.result{
            case .success(let data):
                completionHandler(.success(data))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
        
    }
}
