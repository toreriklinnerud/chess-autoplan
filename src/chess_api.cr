require "./chess_api/datapot"
require "./chess_api/authentication"

class ChessAPI
  @token : String | Nil
  @datapot : Datapot | Nil

  def initialize
  end

  def current_usage
    datapot.current_usage
  end

  def current_size
    datapot.current_size
  end

  def change_plan(plan)
    json_request("/InternalService.asmx/changePriceplan?packageNo=%22#{plan.id}%22&personNumber=%22%22")
  end

  private def datapot
    @datapot ||= Datapot.new(json_request("/InternalService.asmx/loadInitalData"))
  end

  private def token
    @token ||= Authentication.new.token
  end

  private def json_request(path)
    json = "application/json; charset=utf-8"
    cookie = ".DOTNETNUKE=#{token}"
    headers = HTTP::Headers{"Content-Type" => json, "Cookie" => cookie}
    response = HTTP::Client.get(ChessAPI.url(path), headers: headers)
    response.body
  end

  def self.url(path : String)
    "https://minside.chess.no#{path}"
  end
end
