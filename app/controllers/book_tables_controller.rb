class BookTablesController < ApplicationController
  before_action :logged_in_user,:set_book_table, only: [:show, :edit, :update, :destroy]
  layout 'dashboard/dashboard'

  # GET /book_tables
  # GET /book_tables.json
  def index
    @book_tables = BookTable.where(user_id:current_user.id)
  end

  # GET /book_tables/1
  # GET /book_tables/1.json
  def show
  end

  # GET /book_tables/new
  def new
    @book_table = BookTable.new
  end

  # GET /book_tables/1/edit
  def edit
  end

  # POST /book_tables
  # POST /book_tables.json
  def create
    @book_table = BookTable.new(book_table_params)
    @book_table.user_id = current_user.id
    respond_to do |format|
      if @book_table.save
        format.html { redirect_to dashboard_book_path, notice: 'Book table was successfully created.' }
        format.json { render :show, status: :created, location: @book_table }
      else
        format.html { render :new }
        format.json { render json: @book_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_tables/1
  # PATCH/PUT /book_tables/1.json
  def update
    respond_to do |format|
      if @book_table.update(book_table_params)
        format.html { redirect_to dashboard_book_path, notice: 'Book table was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_table }
      else
        format.html { render :edit }
        format.json { render json: @book_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_tables/1
  # DELETE /book_tables/1.json
  def destroy
    @book_table.destroy
    respond_to do |format|
      format.html { redirect_to book_tables_url, notice: 'Book table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def xml_books
    respond_to do |format|
      format.xml { render :xml => BookTable.all }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_table
      @book_table = BookTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_table_params
      params.require(:book_table).permit(:title, :author, :category_id, :user_id)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = t('controllers.users.flash.needed_login_error')
        redirect_to login_url
      end
    end
end
