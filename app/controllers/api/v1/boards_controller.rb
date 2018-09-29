# frozen_string_literal: true

class Api::V1::BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = current_user.boards
                          .order('created_at DESC')
                          .paginate(page: params[:page], per_page: 9)
    render json: @boards
  end

  # GET /boards/1
  # GET /pboards/1.json
  def show
    @board_pins = @board.pins
                        .order('created_at DESC')
                        .paginate(page: params[:page], per_page: 9)
    render json: @board
  end

  # GET /boards/new
  def new
    @board = current_user.boards.build
    render json: @board
  end

  # GET /boards/1/edit
  def edit; end

  # POST /boards
  # POST /boards.json
  def create
    @board = current_user.boards.build(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Tablica została pomyślnie dodana.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }

        render json: @board.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Tablica została pomyślnie zmieniona' }
        format.json { render :show, status: :ok, location: @board }
        render json: @board
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
        render json: @board.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Tablica została pomyślnie usunięta.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:description, :name, :image)
  end

  def correct_user
    @board = current_user.boards.find_by(id: params[:id])
    redirect_to boards_path, notice: 'Nie jesteś uprawiony do edycji tej tablicy' if @board.nil?
  end
end
