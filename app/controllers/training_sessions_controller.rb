class TrainingSessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_training_session, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[show edit update destroy]

  def index
    @training_sessions = current_user.training_sessions
  end

  def show
  end

  def new
    @training_session = current_user.training_sessions.build
  end

  def create
    @training_session = current_user.training_sessions.build(training_session_params)
    if @training_session.save
      redirect_to training_sessions_path, notice: "Sesión creada exitosamente."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @training_session.update(training_session_params)
      redirect_to training_session_path(@training_session), notice: "Sesión actualizada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @training_session.destroy
    redirect_to training_sessions_path, notice: "Sesión eliminada exitosamente."
  end

  private

  def set_training_session
    @training_session = current_user.training_sessions.find_by(id: params[:id])
    redirect_to training_sessions_path, alert: "No autorizado" if @training_session.nil?
  end

  def correct_user
    redirect_to training_sessions_path, alert: "No autorizado" unless @training_session.user == current_user
  end

  def training_session_params
    params.require(:training_session).permit(:date, :activity, :duration, :description)
  end
end
