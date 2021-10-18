import UIKit

enum IDResultListInteractorError: Error {
    case services
    case unknown
}

final class IDResultListInteractorImpl
{
    
    // MARK: Properties
    private let resultListURL = URL(string: "https://www.mocky.io/v3/364d4f62-c183-4f12-ba16-49bfc5c820ab")!
    
    // MARK: - Presenter
    var presenter: IDResultListInteractorCallback?
    
    // MARK: - Session
    var session: SessionDataManager?
    
    init(session: SessionDataManager)
    {
        self.session = session
    }
}

extension IDResultListInteractorImpl: IDResultListInteractor
{
    
    func fetchListSpaces()
    {
        var urlRequest = URLRequest(url: resultListURL)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let data = data, error == nil {
                let jsonDecoder = JSONDecoder()
                if let results = try? jsonDecoder.decode(IDResultsDTO.self, from: data) {
                    let resultWithFavorite = self.updateWithFavorite(model: IDResultsModel.mapperToIDResultsDTO(idResultsDTO: results))
                    self.presenter?.fetchedListSpaces(result: .success(resultWithFavorite))
                }
            } else if let _ = error {
                self.presenter?.fetchedListSpaces(result: .failure(.services))
            } else {
                self.presenter?.fetchedListSpaces(result: .failure(.unknown))
            }
        }.resume()
    }
}

private extension IDResultListInteractorImpl
{
    func updateWithFavorite(model: IDResultsModel) -> [IDResultModel]
    {
        var result: [IDResultModel] = []
        guard let session = self.session else {
            return []
        }
        
        for var item in model.elementList {
            
            let isFavorite: Bool = (session.getListFavoriteSpaceId().contains(item.code ?? ""))
            item.setFavorite(favorite: isFavorite)
            
            result.append(item)
        }
        
        return result
    }
}
