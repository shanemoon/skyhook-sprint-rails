class ApplicationController < ActionController::Base
  protect_from_forgery

  def execute
    %x[cd public/system]
    @output = %x[dir]
  end

end
