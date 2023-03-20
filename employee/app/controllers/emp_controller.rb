class EmpController < ApplicationController
    def index
    	@employee = Emp.all
    end	
 
   def create
    @employees = Emp.new(employees_params)

    if @employees.save
      redirect_to emp_index_path  
    else
      render :new
    end
   end 

   def show
      @employee = Emp.find(params[:id])
   end 
   def edit
      @employee = Emp.find(params[:id])
   end  
   def update
     @employee = Emp.find(params[:id])
     if @employee.update(employees_params)
      @employee.save
      redirect_to emp_index_path
     else
      render :edit
     end
    end 
    def destroy
     @employee=Emp.find(params[:id])
     @employee.destroy
     redirect_to emp_index_path
    end	     
	
    

   def find_employee
        @employee= Emp.find(params[:id])
   end

  def employees_params
    params.require(:emp).permit(:first_name,:last_name,:email,:age,:country,:image,languages_known: [])
  end 
end
