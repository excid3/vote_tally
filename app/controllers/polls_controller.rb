class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  after_action :vote_total, only: [:create, :update]

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll.riding, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll.riding }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def vote_total
      riding = Poll.find(params[:id]).riding
      votes = (riding.liberal_vote_count + riding.conservative_vote_count + riding.ndp_vote_count + riding.green_vote_count + riding.peoples_vote_count)
      if riding # true unless combo_id is nil
        riding.update_attributes(:total_vote_count=>votes)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:riding_id, :number, :candidate_one, :candidate_two, :candidate_three, :candidate_four)
    end
end
