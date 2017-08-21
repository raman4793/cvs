module ApplicationHelper
  def get_user
    if current_user
      current_user
    elsif current_admin
      current_admin
    elsif current_super_admin
      current_super_admin
    elsif current_transcriber
      current_transcriber
    else
      nil
    end
  end

  def business_job_line_graph(jobs)
    line_chart jobs.group_by_day(:created_at).count, height: '500px', width: '700px', discrete: true, library:  {
        title: {text: 'Jobs by date', x: -20},
        yAxis: {
            discrete: true,
            crosshair: true,
            title: {
                text: 'Jobs count'
            }
        },
        xAxis: {
            discrete: true,
            crosshair: true,
            title: {
                text: 'Date'
            }
        }
    }
  end

  def business_usage_bar_graph(jobs)
    pie_chart jobs.group(:user_id).sum(:file_size), library: {
        }
  end

  def eventable_link(event)
    if event.eventable_type == 'Business'
      link_to event.eventable.name, business_url(event.eventable)
    elsif event.eventable_type == 'Job'
        link_to event.eventable.id, job_url(event.eventable)
    elsif event.eventable_type == 'User'
      link_to event.eventable.name, user_url(event.eventable)
    end
  end
end
