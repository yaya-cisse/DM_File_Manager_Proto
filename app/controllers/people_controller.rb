class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
  end
end
