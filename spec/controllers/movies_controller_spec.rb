require 'spec_helper'

describe MoviesController do

	before :each do
		@fake_results = [mock('movie1'), mock('movie2')]
	end

	describe 'find by director' do

		it 'should call the model method that finds all movies by a director' do
			Movie.should_receive(:locate_movies_by_director).with('Star Wars').and_return(@fake_results)
			get :find_by_director, {:title => 'Star Wars'}
		end

		describe 'after Model logic' do 
			before :each do
				Movie.stub(:locate_movies_by_director).with('Star Wars').and_return(@fake_results)
				get :find_by_director, {:title => 'Star Wars'}
			end

			it 'should select the movies by director template for rendering' do
				response.should render_template('find_by_director')
			end

			it 'make the movies by X director available for rendering' do
				assigns(:movies).should == @fake_results
			end
		end
	end
end



#Scenario: add director to existing movie
#  When I go to the edit page for "Alien"
#  And  I fill in "Director" with "Ridley Scott"
#  And  I press "Update Movie Info"
#  Then the director of "Alien" should be "Ridley Scott"

#Scenario: find movie with same director
#  Given I am on the details page for "Star Wars"
#  When  I follow "Find Movies With Same Director"
#  Then  I should be on the Similar Movies page for "Star Wars"
#  And   I should see "THX-1138"
#  But   I should not see "Blade Runner"

#Scenario: can't find similar movies if we don't know director (sad path)
#  Given I am on the details page for "Alien"
#  Then  I should not see "Ridley Scott"
#  When  I follow "Find Movies With Same Director"
#  Then  I should be on the home page
#  And   I should see "'Alien' has no director info"