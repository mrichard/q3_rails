require 'spec_helper'

describe Movie do
	before :each do 
		@movie = FactoryGirl.build(:movie, title: "Star Wars", director: "George Lucas")
		@fake_results = [mock('movie1'), mock('movie2')]
	end

	describe 'sarching for movies by director' do
		it 'should look up chosen movie object via title' do
			Movie.should_receive(:find_by_title).with('Star Wars').and_return(@movie)
			Movie.locate_movies_by_director('Star Wars')
		end

		it 'should query DB for movies of chosen director and return results' do
			Movie.stub(:find_by_title).with('Star Wars').and_return(@movie)
			Movie.should_receive(:find_all_by_director).with(@movie.director).and_return(@fake_results)
			Movie.locate_movies_by_director(@movie.title).should == @fake_results
		end
	end
end