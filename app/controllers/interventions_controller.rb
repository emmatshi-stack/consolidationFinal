class InterventionsController < ApplicationController
    def interventions
        @interventions = Intervention.new
        puts @interventions
        puts params
        
        @isSaved = params["isSaved"]
    end
    
    def getbuildings
        puts params
        custid = params["custormerid"]

        buildings = Building.where(:customer_id => custid)
        puts buildings.inspect
        puts "#################################################"
        respond_to do |format|
         format.json { render json: buildings }
        end

    end

    def getbatteries
        puts params
        buildid = params["buildingid"]

        batteries = Battery.where(:building_id => buildid)

        puts batteries.inspect
        puts "#################################################"
        
        respond_to do |format|
            format.json { render json: batteries }
        end
    end
    def getcolumns
        puts params
        colid = params["batteryid"]

        columns = Column.where(:battery_id => colid)

        puts columns.inspect
        
        respond_to do |format|
            format.json { render json: columns }
        end
    end

    def getelevators
        puts params
        elid = params["columnid"]

        elevators = Elevator.where(:column_id => elid)

        puts elevators.inspect
        
        respond_to do |format|
            format.json { render json: elevators }
        end
    end


    def save
        intervention =  Intervention.new
        puts params

        customer = params["intervention"]["customer_id"]
        building = params["intervention"]["building_id"]
        battery = params["intervention"]["battery_id"]
        column = params["intervention"]["column_id"]
        elevator = params["intervention"]["elevator_id"]
        employee = params["intervention"]["employee_id"]
        description = params["intervention"]["reports"]

        p "user information: "
        p current_user

        intervention.author_id = current_user.id
        intervention.result = "Incomplet"
        intervention.reports = description
        intervention.status = "Pending"
        intervention.customer_id = customer
        intervention.building_id = building
        if battery != "-1"
            intervention.battery_id = battery
        end 
        
        if column != "-1"
            intervention.column_id = column
        end 

        if elevator != "-1"
            intervention.elevator_id = elevator
        end 

        
        
        intervention.employee_id = employee



        puts intervention.inspect
        intervention.save!
        #puts battery.split(" - ")[0]

        #        {"customer_id"=>"1", "building_id"=>"38 - Franklyn Terry", "battery_id"=>"38 - Inactive", "column_id"=>"153 - Active", "elevator_id"=>"Select elevator", "employee_id"=>"17", "description"=>"hshhhstgegre"}, "commit"=>"name of button here", "controller"=>"interventions", "action"=>"save"}

        #redirect_to :action => "interventions", :isSaved => true
        redirect_to quotes_url
    end

    
end