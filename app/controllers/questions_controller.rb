class QuestionsController < ApplicationController
  unloadable
  include IssuesHelper
    
  def index
    filters = {:opened => true}
    filters[:assigned_to_id] = [nil]
    filters[:assigned_to_id] << [User.current.id] unless User.current.nil?
    filters.delete :assigned_to_id if User.current && User.current.admin?
    filters[:"projects.identifier"] = params[:project_id] unless params[:project_id].nil?
    @questions = Question.includes(:issue => :project).where(filters)
    @project = Project.find_by_identifier(params[:project_id]) unless params[:project_id].nil?
  end
  
  def my_issue_filter
    @project = Project.find(params[:project]) unless params[:project].nil?
    
    @query = Query.new(:name => "_",
                       :filters => {'status_id' => {:operator => '*', :values => [""]}}
                       )
    @query.project = @project unless params[:project].nil?
    @query.add_filter("question_assigned_to_id", '=',['me'])

    session[:query] = {:project_id => @query.project_id, :filters => @query.filters}
    redirect_to :controller => 'issues', :action => 'index', :project_id => params[:project]
  end
end
