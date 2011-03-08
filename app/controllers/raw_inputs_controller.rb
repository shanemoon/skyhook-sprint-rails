class RawInputsController < ApplicationController
  # GET /raw_inputs
  # GET /raw_inputs.xml
  def index
    @raw_inputs = RawInput.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @raw_inputs }
    end
  end

  # GET /raw_inputs/1
  # GET /raw_inputs/1.xml
  def show
    @raw_input = RawInput.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @raw_input }
    end
  end

  # GET /raw_inputs/new
  # GET /raw_inputs/new.xml
  def new
    @raw_input = RawInput.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @raw_input }
    end
  end

  # GET /raw_inputs/1/edit
  def edit
    @raw_input = RawInput.find(params[:id])
  end

  # POST /raw_inputs
  # POST /raw_inputs.xml
  def create

    #input_text = params[:input] ? params[:input] : 'Test'
    #@raw_input = RawInput.create(:input => input_text)
    #@raw_input = RawInput.new(params[:raw_input])
    @raw_input = RawInput.create(params[:raw_input])
    input_text = @raw_input.input

    
    #dir_path= ".\\public\\system\\data\\"+@raw_input.id.to_s+ "\\original"
    dir_path= ".\\public\\system\\data\\" + @raw_input.id.to_s
    puts %x[python public/system/test.py #{dir_path} "#{input_text}"]


    file = File.new(dir_path + "_test.txt", "r")
    while (line = file.gets)
      #puts "#{line}"

      item = line.split(",")[0]
      place = line.split(",")[1]
      description = line.split(",")[3]

      @schedule = Schedule.create(:item => item, :place => place, :description => description)
    end

    respond_to do |format|
      if @raw_input.save
        format.html { redirect_to(@raw_input, :notice => 'Raw input was successfully created.') }
        format.xml  { render :xml => @raw_input, :status => :created, :location => @raw_input }
        format.json { render :json => @raw_input}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @raw_input.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /raw_inputs/1
  # PUT /raw_inputs/1.xml
  def update
    @raw_input = RawInput.find(params[:id])

    respond_to do |format|
      if @raw_input.update_attributes(params[:raw_input])
        format.html { redirect_to(@raw_input, :notice => 'Raw input was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @raw_input.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /raw_inputs/1
  # DELETE /raw_inputs/1.xml
  def destroy
    @raw_input = RawInput.find(params[:id])
    @raw_input.destroy

    respond_to do |format|
      format.html { redirect_to(raw_inputs_url) }
      format.xml  { head :ok }
    end
  end
end
