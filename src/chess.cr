class Chess
  getter :token

  @data_pot : Hash(String, JSON::Type) | Nil

  def initialize(@token : String)
  end

  def current_usage
    data_pot["usedWithUnit"].to_s.sub(",", ".").sub("GB", "").to_f
  end

  def current_size
    data_pot["size"].as(Float64).to_i
  end

  def data_pot
    @data_pot ||= fetch_data_pot
  end

  def fetch_data_pot
    plan_data = json_request("/InternalService.asmx/loadInitalData")
    string = String.from_json(plan_data, root: "d")
    parsed = JSON.parse(string)
    data = JSON.parse(parsed["data"].as_s)
    data["dataPot"].as_h
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
    error("CHESS_USERNAME and CHESS_PASSWORD must be set ENV.") unless ENV["CHESS_USERNAME"] && ENV["CHESS_PASSWORD"]
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
