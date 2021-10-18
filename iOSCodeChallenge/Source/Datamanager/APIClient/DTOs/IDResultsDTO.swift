struct IDResultsDTO: Codable
{
    let elementList: [IDResultDTO]
}

struct IDResultsModel
{
    let elementList: [IDResultModel]
    
    static func mapperToIDResultsDTO(idResultsDTO: IDResultsDTO) -> IDResultsModel
    {
        let elementList: [IDResultModel] = idResultsDTO.elementList.map { return IDResultModel.mapperToIDResultDTO(idResultDTO: $0) }
        
        return IDResultsModel(elementList: elementList)
    }

}
