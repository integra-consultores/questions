module Questions
  class HooksBase < Redmine::Hook::ViewListener
    # Have to inclue Gravatars because ApplicationHelper will not get it
    include GravatarHelper::PublicMethods
    
    protected
    
    # Html: "Question for #{question.assigned_to.to_s}"
    def assigned_question_html(question)
      html = "<span class=\"question-line journal-link\">"
      html << "  <a name=\"question-#{h(question.id)}\" href=\"#question-#{h(question.id)}\">"
      html << "#{l(:text_question_for)} #{question.assigned_to.to_s}"
      html << "  </a>  &nbsp; - &nbsp; "
      #html << "<span>#{gravatar(question.assigned_to.mail, { :size => 16, :class => '' })}</span>"
      html << " </span>"
      html
    end
    
    # Html: ""
    def unassigned_question_html(question)
      html = "<span class=\"question-line journal-link\">"
      html << "  <a name=\"question-#{h(question.id)}\" href=\"#question-#{h(question.id)}\">"
      html << l(:text_question_for_anyone)
      html << "  </a> &nbsp; - &nbsp;"
      html << "</span>"
      html
    end
  end
end
