class ApplicationController < ActionController::API

  protected
    def return_message message
      {
        data: {
          message: message
        }
      }
    end

end
