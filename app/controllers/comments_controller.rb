class CommentsController < ApplicationController
  
  def index
    @question = Question.find(params[:question_id])
    @comments = @question.comments.all
  end

  def show
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(comment_params)
    @comment.commenter = current_user.username
    if @comment.save
      redirect_to @question
    else
      flash.now[:danger] = "error"
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to question_comment_url(@question, @comment)
    else
      render :action => "edit"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = @question.comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to question_comments_path(@question), notice: 'Comment was successfully destroyed.' }
      format.xml  { head :ok }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
     def set_comment
       @comment = Comment.find(params[:id])
     end


    # Never trust parameters from the scary internet, only allow the white list through.

    
    def comment_params
      params.require(:comment).permit(:body, :question_id)
    end
end
