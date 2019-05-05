class ReportsController < ApplicationController
  def abducted_percentage
    @non_abducted_count = Survivor.all.where(abducted: false).count.to_f
    @abducted_count = Survivor.all.where(abducted: true).count.to_f
    @survivors_total_count = @non_abducted_count + @abducted_count

    @non_abducted_percentage = (@non_abducted_count / @survivors_total_count) * 100
    @abducted_percentage = (@abducted_count / @survivors_total_count) * 100

    render json: {
      non_abducted: {
        amount: @non_abducted_count.to_i,
        percentage: "#{@non_abducted_percentage.round(2)}%"
      },
      abducted: {
        amount: @abducted_count.to_i,
        percentage: "#{@abducted_percentage.round(2)}%"
      }
    }
  end

  def abducted_survivors
    render json: Survivor.all.where(abducted: true)
  end

  def non_abducted_survivors
    render json: Survivor.all.where(abducted: false)
  end
end
