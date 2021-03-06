class UserService
  def self.conn
    Faraday.new(url: ENV["BASE_URL"]) do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def self.create_user(user_data)
    conn.post("/api/v1/users") do |c|
      c.params[:name] = user_data[:name]
      c.params[:email] = user_data[:email]
    end
  end

  def self.find_by_email(email)
    response = conn.get("/api/v1/user") do |c|
      c.params = {email: email}
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_all_users
    response = conn.get("/api/v1/users")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_user(email)
    id = find_by_email(email)[:data][:id]
    conn.delete("/api/v1/users/#{id}")
  end
end
