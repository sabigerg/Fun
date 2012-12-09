class SessionsController < ApplicationController
  def new
    end

    def create
        student = Student.find_by_username(params[:session][:username].downcase)
        if student && student.authenticate(params[:session][:password])
          sign_in student
          redirect_to student
        else
          flash.now[:error] = 'Invalid username/password combination'
          render 'new'
        end
      end

      def destroy
          sign_out
          redirect_to root_url
        end
end
