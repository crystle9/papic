class LettersController < ApplicationController
  before_filter :authenticate
  before_filter :change_state_to_old, :only => [:show]
  autocomplete :user, :login
  
  def index
    @letters = Letter.with_receiver(current_user.id)
    @letter = Letter.new
    respond_with @letters
  end
  
  def create
    @letter = Letter.new
    @letter.sender_id = current_user.id
    @letter.receiver_id = User.where(:login => params[:letter][:receiver]).first.id
    @letter.content = params[:letter][:content]
    @letter.state = 'valid'
    @letter.save
    respond_with @letter
  end
  
  def show
  end
  
  private
    def change_state_to_old
      @letter = Letter.find(params[:id])
      @letter.state = 'old'
      @letter.save
    end
end