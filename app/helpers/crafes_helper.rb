module CrafesHelper
  
  def crafes_title(page_title = '')
    base_title = "Crafes!"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
end
