class ListsController < ApplicationController
  def home
    @lists = List.all
    @list = List.new
  end

  def index
   @lists = List.all
  end


  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
     redirect_to @list, status: :unprocessable_entity
    end
  end


  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks.includes(:movie)
    @bookmark = Bookmark.new

  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
