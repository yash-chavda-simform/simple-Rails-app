class FacultysController < ApplicationController
  def index
    @facultys = Faculty.all
  end
  def delete
    
  end
end
