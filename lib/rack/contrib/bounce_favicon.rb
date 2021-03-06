module Rack
  # Bounce those annoying favicon.ico requests
  class BounceFavicon
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        [404, {"Content-Type" => "text/html", "Content-Length" => "0"}, []]
      else
        @app.call(env)
      end
    end
  end
end
