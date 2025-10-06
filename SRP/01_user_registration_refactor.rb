# TLDR: solution, use one DTO for each service

# By using different DTO's we can isolate what each service will use
# and if the registration now requires more data we don't touch the DTO for Response anymore

# DTO Dedicated to registration
class UserRegistrationDTO
  attr_accessor :name, :email, :password

  def initialize(name:, email:, password:)
    @name = name
    @email = email
    @password = password
  end
end

# DTO Dedicated to Response
class UserResponseDTO
  attr_accessor :id, :name, :email, :created_at, :status

  def initialize(id:, name:, email:, created_at:, status:)
    @id, = id
    @name = name
    @email = email
    @created_at= created_at # we only keep information that make sense as a response
    @status = status
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

