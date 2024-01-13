module ApplicationHelper
  def sidebar_link_item(name, path)
    class_name = 'channel'
    class_name << ' active' if current_page?(path)

    content_tag :li, class:class_name do
      link_to name, path, class: 'channel_name'
    end
  end
  def page_title(page_title = '', admin = false)
    base_title = if admin
                  'SAMPLE BOARD APP(管理画面)'
                 else
                  'SAMPLE BOARD APP'
                 end

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
