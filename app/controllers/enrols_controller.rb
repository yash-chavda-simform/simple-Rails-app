class EnrolsController < ApplicationController
  def show
      @en = Enrol.find_by(user_id:session[:user_id],event_id:params[:id])
      if @en == nil
        @enrol = Enrol.new(user_id:session[:user_id],event_id:params[:id])
        @enrol.save  
      else
        puts "Already Enroled in this Event"  
      end
      redirect_to events_path
  end
end
