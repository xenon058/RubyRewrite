Rails.application.routes.draw do
    post "owner/:id/delete" => "owner#delete"
    get "owner/login" => "owner#login"
    post "owner/enter" => "owner#enter"
    post "owner/logout" => "owner#logout"
    get "owner/reserveList/:disp" => "owner#reserveList"
    get "reserve/reserveDay" => "reserve#reserveDay"
    get "reserve/reserveRoomList" => "reserve#reserveRoomList"
    post "reserve/reserveCheck" => "reserve#reserveCheck"
    post "reserve/reserveInsert" => "reserve#reserveInsert"
    get "reserve/:no/reserveDetail" => "reserve#reserveDetail"
    get "reserve/reserveConfirm" => "reserve#reserveConfirm"
    get "reserve/reserveFinish" => "reserve#reserveFinish"
    get "/" => "room#index"
    get "/room/roomList" => "room#roomList"
    get "/room/:id/roomList" => "room#roomList"
    get "/room/:no/roomDetail" => "room#roomDetail"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
