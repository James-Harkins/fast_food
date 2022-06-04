class User
  attr_reader :id, :name, :email
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:attributes][:name]
    @email = attributes[:attributes][:email]
  end
end
