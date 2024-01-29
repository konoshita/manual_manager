class Admin::SentencesController < Admin::BaseController
  before_action :set_sentence, only: %i[ show edit update destroy]
  before_action :set_manual, only: %i[ show edit update destroy]
  
  def create
    @sentence = Sentence.new(sentence_params)
    @manual = Manual.find(params[:manual_id])
    if @sentence.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      flash[:danger] = "記事の作成が失敗しました。もう一度試してください。"
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def edit;end
  
  def update
    @sentence.assign_attributes(sentence_params)
      if @sentence.update(sentence_params)
          redirect_to admin_manual_path(@manual)
      else
          flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
          render :edit
      end
  end
  
  def destroy
    @sentence.destroy
    redirect_to admin_manual_path(@manual)
  end

  private
  def set_sentence
    @sentence = Sentence.find(params[:manual_id])
  end
  def set_manual
    @manual = Manual.find(params[:id])
  end

  def sentence_params
    params.require(:sentence).permit(:subtitle, :content, :manual_id, :sentence_image, :sentence_image_cache)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
