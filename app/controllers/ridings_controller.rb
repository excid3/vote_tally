class RidingsController < ApplicationController
  before_action :set_riding, only: [:show, :edit, :update, :destroy, :dashboard]

  # GET /ridings
  # GET /ridings.json
  def index
    @ridings = Riding.all
  end

  # GET /ridings/1
  # GET /ridings/1.json
  def show
  end

  def dashboard
    # votes=0
    # @total_votes = Poll.where(riding_id: @riding.id).sum('candidate_one + candidate_two + candidate_three + candidate_four')

    # @win_number = (@total_votes/2) + 1

    @total_polls = Poll.where(riding_id: @riding.id).count

    @polls_reporting = Poll.where("riding_id = ? AND candidate_one > ?", @riding.id, 0).count

    @voter_turnout = (@riding.total_vote_count.to_f/@riding.eligible_voters) * 100

    vote_totals = {
      "Liberal" => @riding.liberal_vote_count,
      "Conservative" => @riding.conservative_vote_count,
      "NDP" => @riding.ndp_vote_count,
      "Green" => @riding.green_vote_count,
      "People's Party" => @riding.peoples_vote_count
    }

    @predicted = vote_totals.max_by{|k,v| v}[0]

    # if @riding.liberal_vote_count >= @win_number
    #   @predicted = "Liberal"
    # elsif @riding.conservative_vote_count >= @win_number
    #   @predicted = "Conservative"
    # elsif @riding.ndp_vote_count >= @win_number
    #   @predicted = "NDP"
    # elsif @riding.green_vote_count >= @win_number
    #   @predicted = "Green"
    # end

    
  end

  # GET /ridings/new
  def new
    @riding = Riding.new
  end

  # GET /ridings/1/edit
  def edit
  end

  # POST /ridings
  # POST /ridings.json
  def create
    @riding = Riding.new(riding_params)

    respond_to do |format|
      if @riding.save
        format.html { redirect_to @riding, notice: 'Riding was successfully created.' }
        format.json { render :show, status: :created, location: @riding }
      else
        format.html { render :new }
        format.json { render json: @riding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ridings/1
  # PATCH/PUT /ridings/1.json
  def update
    respond_to do |format|
      if @riding.update(riding_params)
        format.html { redirect_to @riding, notice: 'Riding was successfully updated.' }
        format.json { render :show, status: :ok, location: @riding }
      else
        format.html { render :edit }
        format.json { render json: @riding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ridings/1
  # DELETE /ridings/1.json
  def destroy
    @riding.destroy
    respond_to do |format|
      format.html { redirect_to ridings_url, notice: 'Riding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_riding
      @riding = Riding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def riding_params
      params.require(:riding).permit(:number, :name, :province, :eligible_voters, :win_number, :polls_attributes => [:id, :candidate_one])
    end
end
