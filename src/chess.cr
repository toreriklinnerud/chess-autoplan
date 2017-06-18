class Chess
  getter :token

  @datapot : Datapot | Nil

  def initialize(@token : String)
  end

  def current_usage
    datapot.current_usage
  end

  def current_size
    datapot.current_size
  end

  def datapot
    @datapot ||= Datapot.new(json_request("/InternalService.asmx/loadInitalData"))
  end

  def change_plan(plan)
    json_request("/InternalService.asmx/changePriceplan?packageNo=%22#{plan.id}%22&personNumber=%22%22")
  end

  def json_request(path)
    url = Chess.url(path)
    json = "application/json; charset=utf-8"
    cookie = ".DOTNETNUKE=#{token}"
    headers = HTTP::Headers{"Content-Type" => json, "Cookie" => cookie}
    response = HTTP::Client.get(url, headers: headers)
    response.body
  end

  def self.fetch_token
    print "Authenticating... "
    error("CHESS_USERNAME and CHESS_PASSWORD must be set") unless ENV.has_key?("CHESS_USERNAME") && ENV.has_key?("CHESS_PASSWORD")
    login_form = File.read("./src/login_form").sub("{{username}}", ENV["CHESS_USERNAME"]).sub("{{password}}", ENV["CHESS_PASSWORD"])
    response = HTTP::Client.post_form(Chess.url("/?mode=login"), login_form)
    cookies = response.cookies
    if cookies.has_key?(".DOTNETNUKE")
      puts "success!"
      cookies[".DOTNETNUKE"].value
    else
      error("Login failed")
    end
  end

  def self.error(message)
    puts "Error: #{message}"
    Process.exit(-1)
  end

  def self.url(path : String)
    "https://minside.chess.no#{path}"
  end
end
