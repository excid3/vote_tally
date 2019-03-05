class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy, :dashboard]

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
  end

  def dashboard
    # votes=0
    # @total_votes = Poll.where(riding_id: @riding.id).sum('candidate_one + candidate_two + candidate_three + candidate_four')

    # @win_number = (@total_votes/2) + 1

    # @total_polls = Poll.where(riding_id: @riding.id).count

    # @polls_reporting = Poll.where("riding_id = ? AND candidate_one > ?", @riding.id, 0).count

    # @voter_turnout = (@riding.total_vote_count.to_f/@riding.eligible_voters) * 100

    # vote_totals = {
    #   "Liberal" => @riding.liberal_vote_count,
    #   "Conservative" => @riding.conservative_vote_count,
    #   "NDP" => @riding.ndp_vote_count,
    #   "Green" => @riding.green_vote_count,
    #   "People's Party" => @riding.peoples_vote_count
    # }

    # @predicted = vote_totals.max_by{|k,v| v}[0]

    @ridings_reporting = Riding.where("region_id = ? AND liberal_vote_count > ?", @region.id, 0).count
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name)
    end
end
