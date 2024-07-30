class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to root_path, notice: 'Employee was successfully created.'
    else
      @employees = Employee.all
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to root_path, notice: 'Employee was successfully updated.'
    else
      @employees = Employee.all
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path, notice: 'Employee was successfully deleted.'
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :phone)
  end
end