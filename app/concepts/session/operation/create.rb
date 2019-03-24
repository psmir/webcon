class Session::Create < Trailblazer::Operation
  include Oath::ControllerHelpers

  class Present < Trailblazer::Operation
    step Contract::Build( constant: Session::Contract::Create )
  end

  step Nested( Present )
  step Contract::Validate( key: :session )
  step :find_user


  def find_user(options, params:, **)
    options[:user] = authenticate_session(params[:session])
  end
end