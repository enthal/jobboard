class ApplicationController < ActionController::Base
  inherit_resources  # https://github.com/josevalim/inherited_resources  mixes in boilerplate CRUD code
  protect_from_forgery
end
