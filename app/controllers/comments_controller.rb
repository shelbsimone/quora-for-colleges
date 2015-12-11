class CommentsController < ApplicationController

  # # GET /comments
  # # GET /comments.json
  # def index
  #   @question = Question.find(params[:question_id])
  #   @comments = @question.comments
  # end

  # # GET /comments/1
  # # GET /comments/1.json
  # def show
  #   @question = Question.find(params[:question_id])
  #   @comment = @question.comments.find(params[:id])
  # end

  # # GET /comments/new
  # def new
  #   @question = Question.find(params[:question_id])
  #   @comment = @question.comments.new
  # end

  # # GET /comments/1/edit
  # def edit
  #   @question = Question.find(params[:question_id])
  #   @comment = @question.comments.find(params[:id])
  # end

  # # POST /comments
  # # POST /comments.json
  # def create
  #   @question = Question.find(params[:question_id])
  #   @comment = @question.comments.new(params[:comment])
  #   respond_to do |format|
  #     if @comment.save
  #       format.html { redirect_to [@question, @comment], notice: 'Comment was successfully created.' }
  #       format.json { render :show, status: :created, location: @comment }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /comments/1
  # # PATCH/PUT /comments/1.json
  # # def update
  # #   @question = Question.find(params[:question_id])
  # #   @comment = Comment.find(params[:id])
  # #   if @comment.update(params[:comment])
  # #     format.html { redirect_to post_comment_url(@question, @comment), notice: 'Comment was successfully updated.' }
  # #     format.json { render :show, status: :ok, location: @comment }
  # #   else
  # #     format.html { render :edit }
  # #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  # #   end
  # # end
  # def update
  #   @question = Question.find(params[:question_id])
  #   @comment = Comment.find(params[:id])

  #     if @comment.update(comment_params)
  #       format.html { redirect_to [@question, @comment], notice: 'Question was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @question }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end

  # end

  # # DELETE /comments/1
  # # DELETE /comments/1.json
  # def destroy
  #   @question = Question.find(params[:question_id])
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  
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
    @comment = @question.comments.new(params[:comment])
    if @comment.save
      redirect_to question_comment_url(@question, @comment)
    else
      render :action => "new"
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @comment = comments.find(params[:id])
    if @comment.update!(params[:comment])
      redirect_to question_comment_url(@question, @comment)
    else
      render :action => "edit"
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to question_comments_path(@question) }
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
