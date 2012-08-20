FactoryGirl.define do
	factory :movie do
		title 'Fake title'
		rating 'fake rating'
		release_date {10.years.ago}
		director 'Mike Richard'
	end
end