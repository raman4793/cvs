class TranscriberWorker
  include Sidekiq::Worker

  def perform(id)
    # Do something
    upload = Upload.find(id)
    job = Job.new(upload: upload, status: Job.statuses[:in_queue], user: upload.user)
    job.save
    text = `python #{Rails.root.join('bin', 'transcriber.py').to_s} #{upload.get_file}`
    job.update(draft: text, status: Job.statuses[:drafting], nol: text.lines.count)
  end
end
