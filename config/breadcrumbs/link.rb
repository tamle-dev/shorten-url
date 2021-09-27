# index
crumb :links do
  parent :root
  link 'Link', links_path
end

# show
crumb :link do |obj|
  parent :root
  link ::Link.model_name.human(count: 2), links_path
  link obj.slug, link_path(obj)
end

# new
crumb :new_link do
  parent :root
  link ::Link.model_name.human(count: 2), links_path
  link I18n.t('helpers.breadcrumbs.new', default: 'New')
end
