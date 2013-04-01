ActionDispatch::Callbacks.to_prepare do
  require_dependency 'questions/journal_patch'
  require_dependency 'questions/issue_patch'
  require_dependency 'questions/issue_hooks'
  require_dependency 'questions/layout_hooks'
  require_dependency 'questions/journal_hooks'
  #require_dependency 'questions/queries_helper_patch'
  #require_dependency 'questions/query_patch'
end

Redmine::Plugin.register :questions do
  name 'Questions'
  author 'Bishma Stornelli'
  description 'This is a plugin for Redmine that will allow users to ask questions to each other in issue notes'
  version '0.1.0'

  requires_redmine :version_or_higher => '2.2.1'

end

ActiveRecord::Base.observers << :journal_questions_observer
