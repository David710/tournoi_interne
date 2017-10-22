class GroupsController < ApplicationController
  def index
    @group = Group.find(1)
    @players = @group.players
  end

  def show
    @group = Group.find(params[:id])
    @players = @group.players
    render :index
  end

end
