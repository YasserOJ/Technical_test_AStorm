//
//  HTTPTask.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation

public class HTTPTask {
    
    
    class func request<T: Codable>( endPointType: EndPointType, completion : @escaping ((Result<T,Error>) -> ())  )  {
        
        let session = URLSession.shared
        
        guard let url = URL(string: endPointType.url) else { return }
        var request = URLRequest(url: url, timeoutInterval: 30)
        request.httpMethod = endPointType.method
        
        // Set Headers
        endPointType.additionalHeader?.forEach({
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        })
        //Set Params TODO
        
        let task = session.dataTask(with: request) { (data, _, _) in
            DispatchQueue.main.async {
                guard let data = data,
                      let response = try? JSONDecoder().decode(T.self, from: data) else {
                    completion(Result.failure(NSError()))
                    return
                }
                completion(Result.success(response))
            }
        }
        task.resume()
#if DEBUG
        print("url", endPointType.url)
        print("parameters", endPointType.parameters)
#endif
    }
    
}
