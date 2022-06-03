class UserService
  def self.conn
    Faraday.new(url: "http://localhost:5000") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.create_user(user_data)
    response = conn.post("/api/v1/users") do |c|
      # c.options.params_encoder = Faraday::FlatParamsEncoder
      # c.headers = {"CONTENT_TYPE" => "application/json"}
      c.params[:name] = user_data[:name]
      c.params[:email] = user_data[:email]
    end
  end
end
