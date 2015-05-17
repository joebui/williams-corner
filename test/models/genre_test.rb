require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  puts "Create example genre with name: 'Example'. Since there is no genre Example in the gaming industry, this name should be suffice for testing."
  
  def setup
    @genre = Genre.new(name: "Example")
  end
  
  puts "First test, validation test, no change."
  test "validation test" do
    assert @genre.valid?, "invalid genre"
  end
  
  puts "Second test, change genre name to null."
  test "genre name should be present" do
    @genre.name = ''
    assert @genre.valid?, "Test succeeded. Reason for Failure: Genre name is empty."
  end

  puts "Third test, duplicate this genre to test uniqueness."
  test "genre name should be unique" do
    duplicate_genre = @genre.dup
    duplicate_genre.save
    assert @genre.valid?, "Test succeeded. Reason for Failure: Genre name already exists."
  end
  
  puts "Fourth test, change genre name to fewer than 3 characters."
  test "genre name should be equal or longer than 3 characters" do
    @genre.name = 'Ex'
    assert @genre.valid?, "Test succeeded. Reason for Failure: Genre name has fewer than 3 characters. Changed name is " + @genre.name
  end
end
