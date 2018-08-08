class RepliesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_reply, only [:edit, :update, :show, :destroy]
	before_action :set_ask, only [:create, :edit, :show, :update, :destroy]



	def create
		@reply = @ask.replies.create(params[:reply]).permit(:reply, :ask_id)
		@reply.user_id = current_user.id

		respond_to do |format|
			if @reply.save
				format.html {redirect_to ask_path(@ask)}
				format.js #render create.js.erb
			else
		format.html { redirect_to ask_path(@ask), notice: 'Reply did not save'}
		format.js
			end
		end
	end


	def new

	end

	def destroy
		@reply = @ask.replies.find(params[:id])
		@reply.destroy
		redirect_to ask_path(@ask)
	end

	 def edit
    @ask = ask.find(params[:ask_id])
    @reply = @ask.replies.find(params[:id])
  	end

  	def update
  		@repy = @ask.replies.find(params[:id])
  		respond_to do |format|
  			if @reply.update(reply_params)
  				format.html {redirect_to ask_path(@ask), notice: 'Reply successfully updated'}
  			else
        		format.html { render :edit }
        		format.json { render json: @reply.errors, status: :unprocessable_entity }
      		end
      	end
  	end

	private

	def set_ask 
		@ask = Ask.find(params[:ask_id])
	end

	def set_reply
		@reply = Reply.find(params[:id])
	end

	def reply_params
		params.require(:reply), permit(:reply)
	end
end