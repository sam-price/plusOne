module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    # Called after a connection and assgins the current_user to variable
    # of logged in user
    def connect
      self.current_user = find_verified_user
    end

    protected

    # Using device env['warden'] to get current user
    # and for authentication
    def find_verified_user
      if (current_user = env['warden'].user)
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
