class AppController < ApplicationController
  def index
    @book_tables = BookTable.all.paginate(:page => params[:page], :per_page => 8)
  end
end
