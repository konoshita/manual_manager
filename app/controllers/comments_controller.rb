class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def update
    @manual= Manual.find(params[:manual_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated"
      redirect_to @manual
    else
      flash[:danger] = "Comment failed"
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content, :manual_id)  #formにてmanual_idパラメータを送信して、コメントへmanual_idを格納するようにする必要がある。
  end
end
