class CoursesController < ApplicationController
 
 			 
  before_action :find_course, only: [:show, :edit, :update, :destroy]

    def course_params
		params.require(:course).permit(:name, :url, :tagline, :category, :photo)
	end

	def index
		if params[:category]
			@courses = Course.where(category: params[:category])
		else
		@courses = Course.all
		end
	
	end
	def show
		    @course           = Course.find(params[:id])
   			@new_comment    = Comment.build_from(@course, current_user.id, "")
	end
	def new
		@course = Course.new
	end
	def create
		@course = Course.new(course_params)
		
		if @course.save
			redirect_to courses_path	
		else 
			render :new
		end	
	end


	def edit
        
	end
	def update
		

		if 
			@course.update(course_params)
			redirect_to courses_path
		else 
			render :edit
		end

	end
	def destroy
		
		@course.destroy
		redirect_to courses_path

	end

	private
	def find_course 
		@course = Course.find(params[:id])
	end

	
end
