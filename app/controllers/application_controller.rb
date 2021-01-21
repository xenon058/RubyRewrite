class ApplicationController < ActionController::Base
    before_action :side
    def side
        @room_types = RoomType.all
    end
    def ownerclear
        session[:owner] = false
        session[:enter] = false
    end

end
