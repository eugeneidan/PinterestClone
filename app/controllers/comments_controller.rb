class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@pin = Pin.find(params[:pin_id])
		@comment = @pin.comments.create(comments_params)
		@comment.user = current_user
		@comment.save
		redirect_to pin_path(@pin)

	end

	def destroy
		@pin = Pin.find(params[:pin_id])
		@comment = @pin.comments.find(params[:id])
		@comment.destroy
		redirect_to pin_path(@pin)
	end

	private
	def comments_params
		params[:comment].permit(:body)
	end

end
