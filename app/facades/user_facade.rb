class UserFacade
  def self.find_by_email(email)
    user_data = UserService.find_by_email(email)
    User.new(user_data[:data])
  end
end
