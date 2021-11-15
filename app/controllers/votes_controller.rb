class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    params[:vote][:items].each do |vi|
      @vote.vote_items.new(item: vi) unless vi.blank?
    end
    if @vote.save
      redirect_to vote_path(@vote)
    else
      render :new
    end
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def vote
    vote_item_ids = VoteItem.where(vote_id: params[:vote_id]).pluck(:id)
    # TODO : After ADD user_id: current_user.id
    check = VoteAnswer.where(vote_item_id: vote_item_ids, user_id: current_user.id)

    if check.count > 0
      redirect_to vote_path(params[:vote_id])
      return
    end

    # TODO : After ADD user_id: current_user.id
    vote_answer = VoteAnswer.new(user_id: current_user.id, vote_item_id: params[:vote_item_id])
    if vote_answer.save
      redirect_to vote_path(params[:vote_id])
    else
      @vote = Vote.find(params[:vote_id])
      render :show
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:title, :content).merge(user_id: current_user.id)
  end
end
