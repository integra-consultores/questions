class QuestionMailer < Mailer
  def asked_question(journal)
    question = journal.question
    subject = "[Question ##{question.issue.id}] #{question.issue.subject}"
    recipients = [*question.assigned_to.mail] unless question.assigned_to.nil?
    #cc = question.issue.watcher_recipients - recipients
    
    @question = question
    @issue = question.issue
    @journal = journal
    @issue_url = url_for(:controller => 'issues', :action => 'show', :id => question.issue)


    mail :to => recipients,
      :subject => "Re: [#{@issue.project.name} - #{@issue.tracker.name} ##{@issue.id}] #{@issue.subject}"

    #RAILS_DEFAULT_LOGGER.debug 'Sending QuestionMailer#asked_question'
  end
  
  def answered_question(question, closing_journal)
    subject = "[Answered] #{question.issue.subject} ##{question.issue.id}"
    recipients = [question.author.mail] unless question.author.nil?
    

    @question = question
    @issue = question.issue
    @journal = closing_journal
    @issue_url = url_for(:controller => 'issues', :action => 'show', :id => question.issue)

    mail :to => recipients,
      :subject => "Re: [#{@issue.project.name} - #{@issue.tracker.name} ##{@issue.id}] #{@issue.subject}"
  end
  
end
