module ApplicationHelper
  #
  def currently_at(page_title='')
    @page_title = page_title
    render 'shared/menu'
    #render patrial: 'shared/menu'
  end
  
  def nav_tab (title, url, options)
    title == @page_title? (options[:class] += ' text-secondary') :(options[:class] += ' text-white') 
    link_to title, url, options
  end
  
  #method show place where are you, in the header
  def full_title(page_title = '')
    base_title = 'AskIt'
    base_title += "|#{page_title}" if page_title.present?
    base_title
  end
end
