# TLDR: The DTO is breaking SRP.

# The issue with this approach is that by using a single DTO for 2 different services,
# we are making it "attached" to 2 different actors (UserRegistrationService and UserQueryService )
# In this case, if we need to change the DTO for registration, we end up affecting the query service as well.
# a rule of thumb to use here is: "If there are more than one reason to change the class (multiple actors) you are breaking SRP"


# DTO
class UserDTO
  attr_accessor :id, :name, :email, :password, :created_at

  def initialize(id: nil, name:, email:, password: nil, created_at: nil)
    @id, = id
    @name = name
    @email = email
    @password = password
    @created_at= created_at
  end
end


class UserRegistrationService
  def register_user(user)
    raise 'Password cannot be blank' if user.password.blank?

    puts "User registered successfully: #{user}"
  end
end

class UserQueryService
  def get_user_by_id(id)
    UserDTO.new(
      id: 'uuid',
      name: 'John Doe',
      email: 'jd@email.com',
      created_at: Time.zone.now,
    )
  end
end


# Usage

user_dto = UserDTO.new(
  name: 'John Doe',
  email: 'jd@email.com',
  password: 'turbo_password_2000',
  created_at: Time.zone.now,
)

registration_service = RegistrationService.new
registration_service.register_user(user_dto)

query_service = UserQueryService.new
user = query_service.get_user_by_id('uuid')

