class ApplicationController < ActionController::Base
  def current_user

    return @current_user if @current_user



    user_id = session[:current_user_id]



    if user_id

      @current_user = User.find_by_id(user_id)

    else

      @current_user = User.create!(username: "Anonymous")
      session[:current_user_id] = @current_user.id
    end
    @current_user
  end
end
