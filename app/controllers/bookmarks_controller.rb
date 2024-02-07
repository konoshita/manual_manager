class BookmarksController < ApplicationController
  def create
    @manual = Manual.find(params[:manual_id])
#Boardモデルからmanual_idを探してくる。
    current_user.bookmark(@manual)
    redirect_back fallback_location: root_path
  end

  def destroy
    @manual = current_user.bookmarks.find(params[:id]).manual
    current_user.unbookmark(@manual)
    redirect_back fallback_location: root_path
  end
end
