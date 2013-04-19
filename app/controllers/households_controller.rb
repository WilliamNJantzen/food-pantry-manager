class HouseholdsController < ApplicationController

  expose(:households)
  expose(:household, strategy: StrongParametersStrategy)
  expose(:neighbor)
  expose(:neighbors)
  expose(:visit)
  expose(:visits)

  def create
    if household.save
      redirect_to households_path, notice: 'Household was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if household.save
      redirect_to households_path, notice: 'Household was successfully updated.'
    else
      render 'edit'
    end
  end

  def show
    household = Household.find(params[:id])
  end

  def destroy
    household.destroy

    redirect_to households_path, notice: 'Household deleted.'
  end


  private

  def allowable
    [
        :household_name, :name, :box_type, :income1, :income2, :income3, :inc_amt1, :inc_amt2,
        :inc_amt3, :expense1, :expense2, :expense3, :exp_amt1, :exp_amt2, :exp_amt3, :option1,
        :option2, :opt_val1, :opt_val2, :notes,
        neighbors_attributes: [
        :city, :close_date, :date_of_proof, :first_name, :middle_name, :street, :apt,
        :food_stamps, :last_name, :monthly_income, :notes, :house_rank, :birth_date,
        :open_date, :phone, :proof_of_residency_type, :email, :sex, :rent, :residency_date,
        :proof_of_residency_type, :smokes, :spouse, :ssn, :state, :street,
        :utilities, :zip, :age, :created_at, :updated_at, :neighbors_attributes, :encrypted_ssn
    ]
    ]
  end

  def household_params
    params.require(:household).permit(*allowable)
  end

end
