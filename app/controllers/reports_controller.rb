class ReportsController < ApplicationController
  before_action :set_percentage, only: [:abducted_percentage]

  # GET /reports/abducted_percentage
  def abducted_percentage
    render json: {
      non_abducted: {
        amount: @non_abducted_count.to_i,
        percentage: "#{@non_abducted_percentage}%"
      },
      abducted: {
        amount: @abducted_count.to_i,
        percentage: "#{@abducted_percentage}%"
      }
    }
  end

  # GET /reports/abducted_survivors
  def abducted_survivors
    render json: Survivor.all.where(abducted: true)
  end

  # GET /reports/non_abducted_survivors
  def non_abducted_survivors
    render json: Survivor.all.where(abducted: false)
  end

  private
    def set_percentage 
      @non_abducted_count = Survivor.all.where(abducted: false).count.to_f
      @abducted_count = Survivor.all.where(abducted: true).count.to_f
      @survivors_total_count = @non_abducted_count + @abducted_count

      @non_abducted_percentage =  get_percentage(@non_abducted_count, @survivors_total_count).round(2)
      @abducted_percentage =  get_percentage(@abducted_count , @survivors_total_count).round(2)
    end

    def set_survivor
      @survivor = Survivor.all.find(params[:id])
    end

    def get_percentage(minor_number, major_number)
      (minor_number / major_number) * 100
    end
end