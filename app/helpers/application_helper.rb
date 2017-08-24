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
        link_to event.eventable.id, job_url(event.eventable), remote: true
    elsif event.eventable_type == 'User'
      link_to event.eventable.name, user_url(event.eventable)
    end
  end

  def link_to_eventable(event)
    if event.eventable_type == 'Business'
      business_url(event.eventable)
    elsif event.eventable_type == 'Job'
      job_url(event.eventable)
    elsif event.eventable_type == 'User'
      user_url(event.eventable)
    end
  end

  def sales_graph
    charges = get_charges['data']
    array = group_hashes(charges, 'created', 'amount')
    return_array = array.map { |h| h.slice('created', 'amount') }
    return_array.collect{|i| [i['created'],i['amount']]}
  end

  def group_hashes arr, group_field, sum_field
    arr.inject({}) do |res, h|
      (res[h[group_field]] ||= {}).merge!(h) do |key, oldval, newval|
        key.eql?(sum_field) ? (oldval.to_f + newval.to_f).to_s : oldval
      end
      res
    end.values
  end

  def get_charges
    Stripe::Charge.all.as_json
  end

  def each_stripe_charge_for_customer(customer_id, created)
    starting_after = nil
    loop do
      customer_charges = Stripe::Charge.all customer: customer_id,
                                            created: created,
                                            limit: 100,
                                            starting_after: starting_after
      break if customer_charges.none?
      customer_charges.each do |charge|
        yield charge
      end
      starting_after = customer_charges.data.last.id
    end
  end

  def daily_charges_for_customer(customer_id, created=nil)
    charges_by_date = Hash.new(0)

    # For each Stripe charge, store the date and amount into a hash.
    each_stripe_charge_for_customer(customer_id, created) do |stripe_charge|
      # Parses Stripe's timestamp to a Ruby date object. `to_date` converts a DateTime object to a date (daily resolution).
      charge_date = Time.at(stripe_charge.created).to_date
      charge_amount = stripe_charge.amount

      charges_by_date[charge_date] += charge_amount
    end

    charges_by_date
  end
end
