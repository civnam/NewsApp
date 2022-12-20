//
//  NewsAPI.swift
//  StartupNews
//
//  Created by Isaac Dimas on 17/12/22.
//

import Foundation

final class NewsAPI {
    
    // MARK: - Atributes
    private let urlApi = LocalizableKeys.API.urlApi
    
    // MARK: - Methods
    
    /// Makes an API request  according to a category
    ///
    /// - Parameters:
    ///    - category: Represents the name of the category used in the endpoint
    ///    - completion: Represents the clouse for retrivieng the response
    func getNews(category: String, completion: @escaping ( [News] ) -> Void ) {
        guard let url = URL(string: urlApi + category) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("A problem has ocurred", error?.localizedDescription ?? "")
            }
            do {
                if let data = data {
                    let decoder = JSONDecoder()
                    let parsedData = try decoder.decode(APIResponse.self, from: data)
                    completion(parsedData.data)
                }
            } catch {
                print("A problem has ocurred", error)
            }
        }.resume()
    }
}
