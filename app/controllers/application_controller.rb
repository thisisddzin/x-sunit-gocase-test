class ApplicationController < ActionController::API

  protected
    def return_message message
      {
        data: {
          message: I18n.t(message)
        }
      }
    end

end
