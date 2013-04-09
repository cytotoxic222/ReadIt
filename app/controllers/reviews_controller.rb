class ReviewsController < ApplicationController
	def create
		book = Book.find params[:book_id]
		review = book.reviews.new params[:review]
		review.save
		flash[:notice] = "Review saved"
		redirect_to book_path(book)
	end
end
