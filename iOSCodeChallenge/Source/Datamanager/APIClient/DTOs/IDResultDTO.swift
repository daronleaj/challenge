struct IDResultDTO: Codable
{
    let propertyCode: String?
    let thumbnail: String?
    let price: Int?
    let propertyType: String?
    let operation: String?
    let multimedia: IDResultMultimediaDTO?
    let detailUrl: String?
}

struct IDResultModel
{
    let code: String?
    let thumbnail: String?
    let price: Int?
    let type: String?
    let operation: String?
    let multimedia: IDResultMultimediaModel?
    let mainUrl: String?
    var isFavorite: Bool
    
    static func mapperToIDResultDTO(idResultDTO: IDResultDTO) -> IDResultModel
    {
        return IDResultModel(code: idResultDTO.propertyCode,
                             thumbnail: idResultDTO.thumbnail,
                             price: idResultDTO.price,
                             type: idResultDTO.propertyType,
                             operation: idResultDTO.operation,
                             multimedia: IDResultMultimediaModel.mapperToIDResultMultimediaDTO(idResultMultimediaDTO: idResultDTO.multimedia),
                             mainUrl: idResultDTO.detailUrl,
                             isFavorite: false)
    }
    
    mutating func setFavorite(favorite: Bool)
    {
        self.isFavorite = favorite
    }
    
    func getTitle() -> String
    {
        switch (self.operation, self.type) {
        case ("sale", "flat"):
            return R.string.saleFlat^
        case ("rent", "flat"):
            return R.string.rentFlat^
        case ("sale", "penthouse"):
            return R.string.salePenthouse^
        case ("rent", "penthouse"):
            return R.string.rentPenthouse^
        case ("sale", "studio"):
            return R.string.saleStudio^
        case ("rent", "studio"):
            return R.string.rentStudio^
        case ("sale", "chalet"):
            return R.string.saleChalet^
        case ("rent", "chalet"):
            return R.string.rentChalet^
        case ("sale", "duplex"):
            return R.string.saleDuplex^
        case ("rent", "duplex"):
            return R.string.rentDuplex^
        default: return ""
        }
    }
    
    func getDescription() -> String
    {
        return R.string.exampleDescription^
    }
}
