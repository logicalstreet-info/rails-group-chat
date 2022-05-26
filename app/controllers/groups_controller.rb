class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.new
    @groups = Group.public_groups.joins(:participants).where(
                participants: { user_id: current_user.id })
    @users = User.all_except(current_user)

    render 'index'
  end

  def show
    @group = Group.new
    @groups = Group.public_groups.joins(:participants).where(
                participants: { user_id: current_user.id })

    @single_group = Group.find(params[:id])

    @message = Message.new
    @messages = @single_group.messages

    @users = User.all_except(current_user)

    render 'index'
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create!(group_params)
    if @group.save
      flash[:success] = "Group #{@group.name} was created successfully"
      redirect_to groups_path
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :user_ids=>[])
  end
end
