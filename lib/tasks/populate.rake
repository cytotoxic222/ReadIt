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
		end
	end	
end