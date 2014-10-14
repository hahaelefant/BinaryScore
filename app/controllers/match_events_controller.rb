class MatchEventsController < ApplicationController
  before_action :set_match_event, only: [:show, :edit, :update, :destroy]

  # GET /match_events
  # GET /match_events.json
  def index
    @match_events = MatchEvent.all
  end

  # GET /match_events/1
  # GET /match_events/1.json
  def show
  end

  # GET /match_events/new
  def new
    @match_event = MatchEvent.new
  end

  # GET /match_events/1/edit
  def edit
  end

  # POST /match_events
  # POST /match_events.json
  def create
    @match_event = MatchEvent.new(match_event_params)

    respond_to do |format|
      if @match_event.save
        format.html { redirect_to @match_event, notice: 'Match event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @match_event }
      else
        format.html { render action: 'new' }
        format.json { render json: @match_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_events/1
  # PATCH/PUT /match_events/1.json
  def update
    respond_to do |format|
      if @match_event.update(match_event_params)
        format.html { redirect_to @match_event, notice: 'Match event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @match_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_events/1
  # DELETE /match_events/1.json
  def destroy
    @match_event.destroy
    respond_to do |format|
      format.html { redirect_to match_events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_event
      @match_event = MatchEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_event_params
      params.require(:match_event).permit(:id, :eventtype, :minute, :hoeteam, :player_id, :score, :match_id)
    end
end
