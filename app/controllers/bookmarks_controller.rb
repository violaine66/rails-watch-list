class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id]) # Ensure the list exists
    @bookmark = Bookmark.new # Initialize a new bookmark
  end
  
   def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to lists_path, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path, notice: "Signet supprimé avec succès."
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
