class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to "/employees/#{@employee.id}"
        else
            render :edit
        end
    end
    
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to "/employees"
    end


    def employee_params
        params.require(:employee).permit!
    end

end