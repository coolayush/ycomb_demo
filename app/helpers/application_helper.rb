module ApplicationHelper
	def show_flash(sublayout = nil)
    # CSS class for aligning flash inside sub layout.
    layout_flash_class = "sublayout_#{sublayout}_align" if sublayout

    if flash[:notice]
      flash_class = "alert-success"
      flash_msg = flash[:notice]
    elsif flash[:error]
      flash_class = "alert-error"
      flash_msg = flash[:error]
    elsif flash[:warning]
      flash_class = "alert-info"
      flash_msg = flash[:warning]
    end

    content_tag :div, :id => "flash-messages",
      :class => "#{flash_class} #{layout_flash_class} alert",
      :style => flash_class.nil? ? 'display:none' : '' do
      flash_content = content_tag("button", "x", :class => "close", 'data-dismiss' => 'alert')
      flash_content += content_tag :span, flash_msg , {:class => "notice_msg"}

      flash_content
    end
  end
end
