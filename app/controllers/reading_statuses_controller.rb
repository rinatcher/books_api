class ReadingStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reading_status, only: [:update, :destroy]

  # GET /api/v1/reading_statuses
  def index
    reading_statuses = current_user.reading_statuses
    render json: reading_statuses, status: :ok
  end

  # POST /api/v1/reading_statuses
  def create
    reading_status = current_user.reading_statuses.new(reading_status_params)
    if reading_status.save
      render json: reading_status, status: :created
    else
      render json: { errors: reading_status.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /api/v1/reading_statuses/:id
  def update
    if @reading_status.update(reading_status_params)
      render json: @reading_status, status: :ok
    else
      render json: { errors: @reading_status.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reading_statuses/:id
  def destroy
    @reading_status.destroy
    head :no_content
  end

  private

  def set_reading_status
    @reading_status = current_user.reading_statuses.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Status not found' }, status: :not_found
  end

  def reading_status_params
    params.require(:reading_status).permit(:isbn, :status)
  end
end

