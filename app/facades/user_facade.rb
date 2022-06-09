class UserFacade
  def self.find_by_email(email)
    user_data = UserService.find_by_email(email)
    User.new(user_data[:data])
  end

  def self.get_all_users
    users = UserService.get_all_users[:data]
    users.map { |user| User.new(user) }
  end
end
