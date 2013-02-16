# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    #debugger
    Movie.create(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  movie = Movie.find_by_title(title)
  #debugger
  movie['director'].should == director
end

Then /I should be on the Similar Movies page for "(.*)"/ do |title|
  movie = Movie.find_by_title(title)
  #current_path = URI.parse(current_url).path
  current_url.should == director_url(movie.director)
end

  
  







# features/step_definitions/some_definitions.rb
# convenience so you can call debugger from features file.
Then /^I debug$/ do
  debugger
end