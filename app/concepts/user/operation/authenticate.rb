class User::Authenticate < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Contract::Build(constant: User::Contract::Authenticate)
  end

  step Nested(Present)
  step Contract::Validate(key: :session)
  step :find_user
  step :authenticate_user

  def find_user(options, params:, **)
    options[:user] = User.find_by(
      email: params[:session][:email],
      role: params[:session][:role]
    )
  end

  def authenticate_user(options, params:, **)
    options[:user].authenticate(params[:session][:password])
  end
end
