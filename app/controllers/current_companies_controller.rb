class CurrentCompaniesController < ApplicationController
  def index
    matching_current_companies = CurrentCompany.all

    @list_of_current_companies = matching_current_companies.order({ :created_at => :desc })

    render({ :template => "current_companies/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_current_companies = CurrentCompany.where({ :id => the_id })

    @the_current_company = matching_current_companies.at(0)

    render({ :template => "current_companies/show.html.erb" })
  end

  def create
    the_current_company = CurrentCompany.new
    the_current_company.company_name = params.fetch("query_company_name")

    if the_current_company.valid?
      the_current_company.save
      redirect_to("/current_companies", { :notice => "Current company created successfully." })
    else
      redirect_to("/current_companies", { :alert => the_current_company.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_current_company = CurrentCompany.where({ :id => the_id }).at(0)

    the_current_company.company_name = params.fetch("query_company_name")

    if the_current_company.valid?
      the_current_company.save
      redirect_to("/current_companies/#{the_current_company.id}", { :notice => "Current company updated successfully."} )
    else
      redirect_to("/current_companies/#{the_current_company.id}", { :alert => the_current_company.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_current_company = CurrentCompany.where({ :id => the_id }).at(0)

    the_current_company.destroy

    redirect_to("/current_companies", { :notice => "Current company deleted successfully."} )
  end
end
