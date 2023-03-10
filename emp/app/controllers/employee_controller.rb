class EmployeeController < ApplicationController
    before_action :find_employee, only: [:show]
    def index
    	@employee = Employee.all
    end	


	def new 
      @employee = Employee.new
   end

   def create
    @employees = Employee.new(employees_params)

    if @employees.save
      redirect_to employee_index_path    
    else
      render :new
    end
   end

   def show
      @employee = Employee.find(params[:id])
    end 

    def edit

      @employee = Employee.find(params[:id])
          	

      
    end	
    def update
    	@employee = Employee.find(params[:id])
    	if @employee.update(employees_params)
    		redirect_to employee_index_path
    	else 
    	 render :edit
    	end 
    end	 	
    

    def destroy
    	@employee=Employee.find(params[:id])
    	@employee.destroy
    	redirect_to employee_index_path
    end	



    def find_employee
        @employee= Employee.find(params[:id])
    end







   def employees_params
    params.require(:employee).permit(:first_name, :last_name, :email)
  end
end
