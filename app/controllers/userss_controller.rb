class UserssController < ApplicationController

  def create
    # @user = User.create(user_params)
    # if @user.valid?
    #   token = encode_token({ user_id: @user.id })
    #   render json: { user: @user, token: token }
    # else
    render json: { error: 'Invalid username or password' }
    # end
  end

  # LOGGING IN
  def login
    puts "in login"
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      puts "yes"
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      puts "no"
      render json: { error: 'Invalid username or password' }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :age)
  end
end
