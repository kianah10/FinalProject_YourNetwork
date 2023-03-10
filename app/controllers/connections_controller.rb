class ConnectionsController < ApplicationController
  def index
    matching_connections = Connection.all

    @list_of_connections = matching_connections.order({ :created_at => :desc })

    render({ :template => "connections/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_connections = Connection.where({ :id => the_id })

    @the_connection = matching_connections.at(0)

    render({ :template => "connections/show.html.erb" })
  end

  def create
    the_connection = Connection.new
    #the_connection.user_id = params.fetch("query_user_id")
    the_connection.comment = params.fetch("query_comment")
    the_connection.photo = params.fetch("query_photo")
    #the_connection.company_id = params.fetch("query_company_id")
    #the_connection.connection_of_connections_id = params.fetch("query_connection_of_connections_id")
    the_connection.current_company = params.fetch("query_current_company")
    the_connection.connection_name = params.fetch("query_connection_name")
    the_connection.save
    redirect_to("/connections")
   # if the_connection.valid?
      #the_connection.save
      #redirect_to("/connections", { :notice => "Connection created successfully." })
    #  redirect_to("/")
   # else
     # redirect_to("/connections", { :alert => the_connection.errors.full_messages.to_sentence })
   # end
  end

  def update
    the_id = params.fetch("path_id")
    the_connection = Connection.where({ :id => the_id }).at(0)

    the_connection.user_id = params.fetch("query_user_id")
    the_connection.comment = params.fetch("query_comment")
    the_connection.photo = params.fetch("query_photo")
    the_connection.company_id = params.fetch("query_company_id")
    the_connection.connection_of_connections_id = params.fetch("query_connection_of_connections_id")
    the_connection.current_company = params.fetch("query_current_company")
    the_connection.connection_name = params.fetch("query_connection_name")

    if the_connection.valid?
      the_connection.save
      redirect_to("/connections/#{the_connection.id}", { :notice => "Connection updated successfully."} )
    else
      redirect_to("/connections/#{the_connection.id}", { :alert => the_connection.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_connection = Connection.where({ :id => the_id }).at(0)

    the_connection.destroy

    redirect_to("/connections", { :notice => "Connection deleted successfully."} )
  end
end
