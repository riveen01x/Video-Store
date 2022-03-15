desc "create default actors"
task :create_actors => :environment do
  actors = [
     { name: 'Chad Lowe', video_ids: [1, 2, 5, 11, 12, 6, 14] },
     { name: 'Ian Lowe', video_ids: [11, 12, 6, 14] },
     { name: 'Peter Adams', video_ids: [1, 2, 5, 11, 12, 6, 14] },
     { name: 'Kenneth Adams', video_ids: [1, 2, 5, 11, 12, 6, 4] },
     { name: 'Tammin Sursok', video_ids: [1, 11, 12] },
]

	actors.each do |actor|
	 this_actor = Actor.where(
	   name: actor[:name],
	 ).first_or_initialize
	 
	 this_actor.update!(
	   video_ids: actor[:video_ids],
	 )

	 this_actor.save
	end
end
