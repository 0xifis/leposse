class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    if @game.host_id != current_user.id
      redirect_to games_path
      flash[:alert] = "You cannot edit this game :P"
    end
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    @venues = Venue.find(:all)
    @selected_venue = @venues[1]
    @game.host_id = current_user.id

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    if @game.host_id != current_user.id
      redirect_to games_path
      flash[:alert] = "You cannot edit this game :P"
    else
      @game.destroy
      respond_to do |format|
        format.html { redirect_to games_url }
        format.json { head :no_content }
      end
    end
  end

  def join
    # Game.find(params[:id]).users.create({user_id: current_user.id})
    @member = GamesUsers.new 
    @member.user_id = current_user.id
    @member.game_id = params[:id]
    @member.save  
    respond_to do |format|
      format.html { redirect_to game_path(params[:id]) }
      format.json { head :no_content }
    end
  end

  def unjoin
    current_user.games.delete(Game.find(params[:id]))
    respond_to do |format|
      format.html { redirect_to game_path(params[:id]) }
      format.json { head :no_content }
    end
  end
end
