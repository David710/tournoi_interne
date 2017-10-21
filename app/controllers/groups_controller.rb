class GroupsController < ApplicationController
  def index
    @group = Group.where(name: "1.1").first
    @players = @group.players
  end
end
