class User::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(User, :new)
    step Contract::Build(constant: User::Contract::Create)
  end

  step Nested(Present)
  step Contract::Validate(key: :user)
  step Contract::Persist()
  step :create_consultant_profile

  def create_consultant_profile(options, **)
    options[:model].create_consultant_profile if options[:model].consultant?
    options[:model]
  end
end
