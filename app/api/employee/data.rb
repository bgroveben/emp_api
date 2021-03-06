##! This file holds the class to access the Employee model.

module Employee
  class Data < Grape::API

    resource :employee_data do
      ##! Create the first API endpoint to retrieve all employee details
      desc "List all Employees"
      get do
        EmpData.all
      end

      ##! Add another endpoint to create a new employee
      desc "Create a new Employee"
      ##! We need certain values for our employees, like name, address, and age
      # This takes care of parameter validation
      params do
        requires :name, type: String
        requires :address, type: String
        requires :age, type: Integer
      end
      # This takes care of creating the employee
      post do
        EmpData.create!({
          name:params[:name],
          address:params[:address],
          age:params[:age]
        })
      end

      ##! Add another endpoint to delete an employee
      desc "Delete an Employee"
      params do
        requires :id, type: String
      end
      delete ':id' do
        EmpData.find(params[:id]).destroy!
      end

      ##! Add an endpoint to update an employee's address
      desc "Update an Employee's address"
      params do
        requires :id, type: String
        requires :address, type: String
      end
      put ':id' do
        EmpData.find(params[:id]).update({
          address:params[:address]
        })
      end
    end

  end
end
