class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  get "/profile" do
    redirect '/login' unless logged_in?
    @user = current_user
    redirect "/users/#{@user.username}"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/
  get "/users/:username" do
    @user = User.find_by(username: params[:username])

    if @user
      @reviews = @user.reviews

      erb :"/users/show.html"
    else
      erb :"/users/404.html"
    end

  end

  # GET: /users/<user>/edit
  get "/users/:username/edit" do
    redirect '/login' unless logged_in?
    @user = current_user
    erb :'/users/edit.html'
  end

  # PATCH: /users/<username>
  patch "/users/:username" do
    @user = User.find_by(username: params[:username])
    @user.update(params[:user])

    session[:user_id] = @user.id
    redirect "/users/#{@user.username}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    if logged_in?
      @user = User.find(params[:id])
      if @user == current_user
        @user.destroy
        redirect "/logout"
      else
        redirect "/users/#{params[:id]}"
      end
    else
      redirect "/users/#{params[:id]}"
    end

  end
end
