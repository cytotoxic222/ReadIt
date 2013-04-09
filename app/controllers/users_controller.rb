class UsersController < ApplicationController
	before_filter :login_required, :except => [:index, :new, :create]

	def index
		@users = User.all
	end

	def show
		@user = User.find params[:id]
		@reviews = @user.reviews
		@books = @user.books
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new params[:user]
		if @user.save
			flash[:notice] = "#{@user.username}'s account created"
			redirect_to @user
		else
			render :new
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update_attributes(params[:user])
			flash[:notice] = "#{@user.username}'s account updated"
			redirect_to @user
		else
			render :edit
		end
	end

	private
	def admin_required
		unless current_admin
			flash[:error] = "Only logged in admins can access this page"
			redirect_to books_path
		end
	end

	def login_required
		unless current_user
			flash[:error] = "Must be logged in to view this page"
			redirect_to books_path
		end
	end
end
