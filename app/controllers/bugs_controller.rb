class BugsController < ApplicationController
    layout 'dashboard'
    def index
        @bugs = Bug.all
    end
end
