class TrailsController < ApplicationController

  # GET: /trails
  get "/trails" do
    erb :"/trails/index.html"
  end

  # GET: /trails/new
  get "/trails/new" do
    erb :"/trails/new.html"
  end

  # POST: /trails
  post "/trails" do
    @trail = Trail.create(params[trail])
    @trail.save

    redirect "/trails/#{@trail.id}"
  end

  # GET: /trails/5
  get "/trails/:id" do
    @trail = Trail.find(params[:id])
    @reviews = @trail.reviews
    @review_count = @reviews.count
    erb :"/trails/show.html"
  end

  # GET: /trails/5/edit
  get "/trails/:id/edit" do
    @trail = Trail.find(params[:id])
    erb :"/trails/edit.html"
  end

  # PATCH: /trails/5
  patch "/trails/:id" do
    @trail = Trail.find(params[:id])
    @trail.update(params[:trail])

    redirect "/trails/#{@trail.id}"
  end

  get "/trails/:id/review" do
    @trail = Trail.find(params[:id])

    erb :"/trails/review.html"
  end

  post "/trails/:id" do
    @trail = Trail.find(params[:id])
    @review = Review.new(params[:review])
    @review.user = current_user
    @trail.reviews << @review
    @trail.save

    redirect "/trails/#{params[:id]}"
  end

  # # DELETE: /trails/5/delete
  # delete "/trails/:id/delete" do
  #   redirect "/trails"
  # end
end
