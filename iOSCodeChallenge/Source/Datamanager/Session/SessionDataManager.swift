import Foundation

protocol SessionDataManager
{
    func getListFavoriteSpaceId() -> [String]
    func addSpace(_ idSpace: String)
    func deleteSpace(_ idSpace: String)
}

class SessionDataManagerImpl
{
    static let shared = SessionDataManagerImpl()

    // MARK: - ListFavoriteSpaceId
    @UserDefaultEncoded(key: "listFavoriteSpaceId", default: [])
    var listFavoriteSpaceId: [String]
}

// MARK: - ListFavoriteSpaceId
extension SessionDataManagerImpl: SessionDataManager
{
    func getListFavoriteSpaceId() -> [String]
    {
        return listFavoriteSpaceId
    }
    
    func addSpace(_ idSpace: String)
    {
        if !listFavoriteSpaceId.contains(idSpace) {
            listFavoriteSpaceId.append(idSpace)
        }
    }
    
    func deleteSpace(_ idSpace: String)
    {
        listFavoriteSpaceId.removeAll(where: { $0 == idSpace })
    }
}
