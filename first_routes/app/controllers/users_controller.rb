class UsersController < ApplicationController
  #GET http method
  def index
    users = User.all
    render json: users
  end

  #POST http method
  def create
    user = User.new(params[:username].permit(:name))
    if user.save
      render json: user
    else
      render(json: user.errors.full_messages, status: :unprocessable_entity)
    end
  end

  #GET http method
  def new
    render text:"I'm in the new action!"
  end

  #GET http method
  def edit

  end

  #GET http method
  def show
    #multiple ways to find user by id:

    #these return null if not in users:
    # user = User.find_by(id: params[:id])
    user = User.find_by_id(params[:id])

    #returns an error if not in users:
    # user = User.find(params[:id])

    render json: user
  end

  #PATCH & PUT http method
  def update
    user = User.find(params[:id])
    user.update(user_params)
    render text: "you update a user"
  end

  #DELETE http method
  def destroy
    user = User.find(params[:id])
    user.destroy
    render text: "deleted a user"
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
