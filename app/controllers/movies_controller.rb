class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params["id"])
  end

  def new_form
  end

  def create_row
    @movie.title = params[:the_title]
    @movie.year = params[:the_year]
    @movie.duration = params[:the_duration]
    @movie.description = params[:the_description]
    @movie.image_url = params[:the_image_url]
    @movie.director_id = params[:the_director_id]

    @movie.save

    render("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    id = params[:id]
    record = Movie.find(id)
    record.title = params[:title]
    record.year = params[:year]
    record.duration = params[:duration]
    record.description = params[:description]
    record.image_url = params[:image_url]
    record.director_id = params[:director_id]
    record.save
    @movie = Movie.find(id)
    render("show")
  end

  def destroy
    movie = Movie.find(params[:id])

    movie.destroy
  end
end
