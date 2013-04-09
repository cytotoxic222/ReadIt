namespace :db do
	desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'faker'
		[Book].each(&:delete_all)
		Book.populate 50 do |book|
			book.title 		 = Populator.words(1..3).titleize
			book.author 	 = Faker::Name.name
			book.description = Populator.sentences(2..10)

			Review.populate 2..10 do |review|
				review.book_id = book.id
				review.rating = [0, 1, 2, 3, 4, 5]
				review.author = Faker::Name.name
				review.text = Populator.sentences(2..5)
			end
		end
	end	
end