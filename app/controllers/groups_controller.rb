class GroupsController < ApplicationController
  def index
    @group = Group.find(params[:id])
    @players = @group.players
  end
end
