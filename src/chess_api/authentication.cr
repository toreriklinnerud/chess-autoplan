class ChessAPI
  class Authentication
    def token
      print "Authenticating... "
      cookies = HTTP::Client.post_form(ChessAPI.url("/?mode=login"), payload).cookies
      if cookies.has_key?(".DOTNETNUKE")
        puts "success!"
        token = cookies[".DOTNETNUKE"].value
      else
        error("Login failed")
      end
    end

    private def payload
      if !ENV.has_key?("CHESS_USERNAME") || !ENV.has_key?("CHESS_PASSWORD")
        error("CHESS_USERNAME and CHESS_PASSWORD must be set")
      end

      File.read("./src/chess_api/authentication_template")
          .sub("{{username}}", ENV["CHESS_USERNAME"])
          .sub("{{password}}", ENV["CHESS_PASSWORD"])
    end

    private def error(message)
      puts "Error: #{message}"
      Process.exit(-1)
    end
  end
end
