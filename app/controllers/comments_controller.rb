class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@posts = Post.all(:order =>"created_at DESC")
		@comment = Post.find(params[:post_id]).comments.new(params[:comment])
		if @comment.save
			redirect_to post_path(@post)
		else
			render :template => "posts/show"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@commnet.destroy
		render json: { comment: @comment }
	end

end
