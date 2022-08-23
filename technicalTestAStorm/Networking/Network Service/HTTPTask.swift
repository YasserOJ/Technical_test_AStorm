//
//  HTTPTask.swift
//  technicalTestAStorm
//
//  Created by Yasser Omar Jammeli on 22/8/2022.
//

import Foundation

public enum GenericResult<Value: Codable> {
    case success(Value?)
    case failure(GenericErrorModel)
}


public class HTTPTask {
    
    
    class func request<T: Codable>( endPointType: EndPointType, completion : @escaping (GenericResult<T>) -> Void)  {
        
        let session = URLSession.shared
        
        guard let url = URL(string: endPointType.url) else { return }
        var request = URLRequest(url: url, timeoutInterval: 30)
        request.httpMethod = endPointType.method
        
        // Set Headers
        endPointType.additionalHeader?.forEach({
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        })
        //Set Params TODO
        
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    let serverError = String("900")
                    let error = GenericErrorModel.init(message: "Server Error", code: serverError)
                    completion(.failure(error))
                    return
                }
                let result : GenericResult<T> = JSONDecoder().decodeResponse(from: data, urlResponse: urlResponse, error: error)
                completion(result)
            }
        }
        task.resume()
#if DEBUG
        print("url", endPointType.url)
        print("parameters", endPointType.parameters)
#endif
    }
    
}


extension JSONDecoder {
    
    func decodeResponse<T: Codable>(from response: Data, urlResponse : URLResponse?, error: Error?) -> GenericResult<T> {
        
        guard error == nil else {
            let serverError = String("900")
            let error = GenericErrorModel.init(message: "Server Error", code: serverError)
            return .failure(error)
        }
        if let urlResponse = urlResponse as? HTTPURLResponse{
            if urlResponse.statusCode >= 200 && urlResponse.statusCode < 300 {
                return parseData(data: response)
            } else {
                return parseError(data: response)
            }
        } else{
            let serverError = String("900")
            let error = GenericErrorModel.init(message: "Server Error", code: serverError)
            return .failure(error)
        }
        
    }
    
    func parseData<T: Codable>(data: Data) -> GenericResult<T> {
        do {
            let item = try decode(T.self, from: data)
            return .success(item)
        } catch {
            return .failure(GenericErrorModel.init(message: "Decoding Error", code: "-1"))
        }
    }
    
    func parseError<T: Codable>(data: Data) -> GenericResult<T> {
        do {
            let item = try decode(GenericErrorModel.self, from: data)
            return .failure(item)
        } catch {
            return .failure(GenericErrorModel.init(message: "Decoding Error", code: "-1"))
        }
    }
}
